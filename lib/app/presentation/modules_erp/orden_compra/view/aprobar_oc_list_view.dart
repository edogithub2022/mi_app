import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/number_format.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/view/aprobar_oc_view.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/widgets/card_listview.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class AprobarOcListView extends StatefulWidget {
  final int codempresa;
  const AprobarOcListView({
    Key? key,
    required this.codempresa,
  }) : super(key: key);

  @override
  State<AprobarOcListView> createState() => _AprobarOcListViewState();
}

class _AprobarOcListViewState extends State<AprobarOcListView> {
  late int codempresa = widget.codempresa;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ChangeNotifierProvider(
        create: (_) => OrdenCompraBloc(
          erpRepository: context.read(),
        )..getOcByEmpresa(
            codempresa: codempresa.toString(),
            estado: 'PENDIENTE',
          ),
        builder: (context, _) {
          final OrdenCompraBloc bloc = context.watch();
          SessionProvider sessionProvider = context.watch();
          Usuario? usuario = sessionProvider.usuario;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Row(
                children: [
                  // Flecha para ir a la página anterior
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, 'aprobarOc');
                    },
                    icon: const Icon(Icons.arrow_back_ios_new,
                        size: 20, color: Colors.white70),
                  ),
                  const Text("Aprobación OC"),
                ],
              ),
            ),
            drawer: SideMenu(
              urlLogo: usuario!.urlLogo ??
                  'https://res.cloudinary.com/dmpdnoked/image/upload/v1684947001/foo4fd1ptdnn8i1mon5t.png',
            ),

            //Desplegar lista de ordenCompraTotales
            body: bloc.state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              failed: (failure) => Center(child: Text(failure.name)),
              error: (errors) {
                final String msg = errors
                    .toString()
                    .replaceAll("body[", "\n")
                    .replaceAll("[", "")
                    .replaceAll("]", "");
                return Center(child: Text(msg));
              },
              loadeds: (ordenCompraTotales) => _listview(
                ordenCompraTotales,
                bloc,
              ),
              loadedDET: (_) => null,
              loaded: (_) => null,
              loadedReturning: (_) => null,
              loadedByEmpresas: (_) => null,
            ),
          );
        },
      ),
    );
  }

  ListView _listview(
    List<OrdenCompraTotales> ordenCompraTotales,
    OrdenCompraBloc bloc,
  ) {
    return ListView.builder(
        itemCount:
            ordenCompraTotales.isNotEmpty ? ordenCompraTotales.length : 0,
        itemBuilder: (BuildContext context, index) {
          OrdenCompraTotales ordenCompraTotal = ordenCompraTotales[index];
          NumberFormat number =
              numberFormat(codmoneda: ordenCompraTotales[index].codmoneda ?? 1);
          return GestureDetector(
            onTap: () async {
              //Con push no es necesario crar una ruta se llama directamente
              //ademas pasamos los totales de OC como parametro a la segunda pagina
              //y en la segunda pagina se utilizara provider para el formulario

              if (!mounted) {
                return;
              }

              final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AprobarOcView(
                            ordenCompraTotales: ordenCompraTotal,
                          )));
              //Si no es null se elimina de la lista
              if (result != null) {
                List<OrdenCompraTotales> ocTotList = bloc.ordenCompraTotales;
                ocTotList.removeAt(index);
              }
              setState(() {});
            },
            child: CardListView(
              ordenCompraTotal: ordenCompraTotal,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${ordenCompraTotal.razonSocial}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Preferences.isDarkmode
                                ? Colors.black54
                                : const Color.fromRGBO(250, 253, 191, 1.0),
                            border: Border.all(
                              color: Colors.black45, // Color del borde
                              width: 0.5, // Ancho del borde
                            ),
                            // borderRadius: BorderRadius.circular(
                            //     10.0), // Radio de los bordes
                          ),
                          padding: const EdgeInsets.all(
                              8.0), // Agrega un padding de 8.0 en todos los lados

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Solicitado por',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    ordenCompraTotal.soliCodsolicitador,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height:
                                    30, // Ajusta la altura según tus necesidades
                                child: VerticalDivider(
                                  color: Colors.black45,
                                  thickness: 0.5,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Comprador',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    ordenCompraTotal.soliCodcomprador,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height:
                                    30, // Ajusta la altura según tus necesidades
                                child: VerticalDivider(
                                  color: Colors.black45,
                                  thickness: 0.5,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    'Fecha OC',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    ordenCompraTotal.fechaCreacion != null
                                        ? DateFormat('dd/MM/yyyy').format(
                                            ordenCompraTotal.fechaCreacion!)
                                        : '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: SizedBox(
                                height: 50,
                                child: SingleChildScrollView(
                                  child: Text(
                                    'Obs: ${ordenCompraTotal.observaciones}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            ordenCompraTotal.proveNombre,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          '${ordenCompraTotal.proveRutn}-${ordenCompraTotal.proveRutd}',
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 1,
                            right: 1,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.black12,
                              border: Border.all(
                                color: Colors.black45,
                                width: 0.5,
                              ),
                            ),
                            padding: const EdgeInsets.all(
                                8.0), // Agrega un padding de 8.0 en todos los lados

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'NETO',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          'IVA',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          'ESPECIFICO',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          'EXENTO',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          number.format(
                                              ordenCompraTotal.totalNeto),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                        const Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          number.format(
                                              ordenCompraTotal.totalIva),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                        const Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          number.format(
                                              ordenCompraTotal.totalEspecifico),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                        const Divider(
                                          thickness: 0.5,
                                          color: Colors.black45,
                                        ),
                                        Text(
                                          number.format(
                                              ordenCompraTotal.totalExento),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
    // ListView.builder(
    //   itemBuilder: (_, index) {
    //     final user = usuario[index];
    //     return ListTile(
    //       title: Text(user.nombre),
    //     );
    //   },
    //   itemCount: usuario.length,
    // );
  }
}
