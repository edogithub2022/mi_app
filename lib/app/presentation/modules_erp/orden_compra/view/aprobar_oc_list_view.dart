import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/number_format.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/view/aprobar_oc_view.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/widgets/card_listview.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class AprobarOcListView extends StatefulWidget {
  const AprobarOcListView({Key? key}) : super(key: key);

  @override
  State<AprobarOcListView> createState() => _AprobarOcListViewState();
}

class _AprobarOcListViewState extends State<AprobarOcListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ChangeNotifierProvider(
        create: (_) => OrdenCompraBloc(
          erpRepository: context.read(),
        )..init(
            codempresa: "",
            estado: 'PENDIENTE',
          ),
        builder: (context, _) {
          final OrdenCompraBloc bloc = context.watch();
          SessionProvider sessionProvider = context.watch();
          Usuario? usuario = sessionProvider.usuario;

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Aprobacion OC"),
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
        itemCount: ordenCompraTotales.length,
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
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ordenCompraTotal.proveNombre,
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      '${ordenCompraTotal.proveRutn}-${ordenCompraTotal.proveRutd}',
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Obs: ${ordenCompraTotal.observaciones}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(
                                //   'SC: ${ordenCompraTotal.numeroSolicitud}',
                                //   style: const TextStyle(
                                //       fontWeight: FontWeight.w300),
                                // ),
                                const Text(
                                  'Solitado por',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  ordenCompraTotal.soliCodsolicitador,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                                const Text(
                                  'Comprador',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  ordenCompraTotal.soliCodsolicitador,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NETO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'IVA',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'ESPECIFICO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  'EXENTO',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' : ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  ' : ',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  number.format(ordenCompraTotal.totalNeto),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  number.format(ordenCompraTotal.totalIva),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  number
                                      .format(ordenCompraTotal.totalEspecifico),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  number.format(ordenCompraTotal.totalExento),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
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
