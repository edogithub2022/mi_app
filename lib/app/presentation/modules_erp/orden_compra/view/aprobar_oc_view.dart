import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:mi_app/app/domain/models/erp/orden_compra/orden_compra_cab.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/helpers/number_format.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_erp/orden_compra/widgets/show_input_dialog_oc.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class AprobarOcView extends StatelessWidget {
  final OrdenCompraTotales ordenCompraTotales;
  const AprobarOcView({
    Key? key,
    required this.ordenCompraTotales,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ChangeNotifierProvider(
        create: (_) => OrdenCompraBloc(
          erpRepository: context.read(),
        )..getOcDet(
            codempresa: ordenCompraTotales.codempresa.toString(),
            correlativo: ordenCompraTotales.correlativo.toString(),
          ),
        builder: (context, _) {
          final OrdenCompraBloc bloc = context.watch();

          return Scaffold(
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
              loaded: (_) => null,
              loadedDET: (ocdet) => _ListView(
                  ordenCompraTotales: ordenCompraTotales, ocDet: ocdet),
              loadeds: (_) => null,
              loadedReturning: (_) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // Navigator.of(context).pop();
                  Navigator.pop(context, ordenCompraTotales);
                });
                return null;
              },
              loadedByEmpresas: (_) => null,
            ),
          );
        },
        // child: _ListView(
        //   ordenCompraTotales: ordenCompraTotales,
        // ),
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final OrdenCompraTotales ordenCompraTotales;
  final List<OrdenCompraCab> ocDet;

  const _ListView({
    required this.ordenCompraTotales,
    required this.ocDet,
  });
  @override
  Widget build(BuildContext context) {
    final OrdenCompraBloc bloc = context.watch();
    //Para dar formato a los montos pesos o dolar
    NumberFormat number =
        numberFormat(codmoneda: ordenCompraTotales.codmoneda ?? 1);

    //inicializar selectedOrdenCompraTotales
    //.copy para romper la referencia y no afecte hasta que persista en la bd
    bloc.selectedOrdenCompraTotales = ordenCompraTotales.copy();

    //PERSISTIR EN LA DB, RECHAZAR O GRABAR
    void updateDisplayInput(
      BuildContext context, {
      required String msgErr,
      final TipoInput? tipoInput,
      final String? title,
    }) async {
      final OrdenCompraTotales selectedOrdenCompraTotales =
          bloc.selectedOrdenCompraTotales;

      var value = await showInputDialogOc(
        context,
        tipoInput: tipoInput,
        title: title,
        selectedOCtot: selectedOrdenCompraTotales,
      );

      if (value == '') {
        () {
          displayDialogIOS(
            context,
            msgErr,
          );
        }();
        value = null;
      }

      if (value != null) {
        // ignore: use_build_context_synchronously
        // ProgressDialog.show(context);

        switch (tipoInput) {
          case TipoInput.observaciones:
            selectedOrdenCompraTotales.observaciones = value;
            break;
          case TipoInput.rechazada:
            selectedOrdenCompraTotales.motivoRechazo = value;
            selectedOrdenCompraTotales.estadoRecepcion = 'RECHAZADA';
            break;
          case TipoInput.aprobada:
            selectedOrdenCompraTotales.estadoRecepcion = value;
            break;
          default: // Without this, you see a WARNING.
        }

        await bloc.updateEstadoOc(
          codempresa: '1',
          correlativo: selectedOrdenCompraTotales.correlativo.toString(),
          motivoRechazo: selectedOrdenCompraTotales.motivoRechazo.toString(),
          estado: selectedOrdenCompraTotales.estadoRecepcion,
        );

        // ignore: use_build_context_synchronously
        // Navigator.pop(context);

        final state = bloc.state;
        state.when(
          loading: () => '',
          failed: (failure) => NotificationsHelper.showSnacbar(failure.name),
          error: (errors) {
            final String msg = errors
                .toString()
                .replaceAll("body[", "\n")
                .replaceAll("[", "")
                .replaceAll("]", "");
            displayDialogIOS(context, msg);
          },
          loaded: (_) => null,
          loadedDET: (_) => null,
          loadeds: (_) => null,
          loadedReturning:
              (List<OrdenCompraCabReturning> ordenCompraCabReturning) {
            String newValue = value ?? '';
            String msg = ' :  $newValue';
            switch (tipoInput) {
              case TipoInput.aprobada:
                msg =
                    'Estado actualizado -> ${ordenCompraTotales.estadoRecepcion} $msg';
                ordenCompraTotales.estadoRecepcion = newValue;
                break;
              case TipoInput.rechazada:
                newValue = 'RECHAZADA';
                msg = ' :  $newValue';
                msg =
                    'Estado actualizado -> ${ordenCompraTotales.estadoRecepcion} $msg';
                ordenCompraTotales.estadoRecepcion = newValue;
                break;
              case TipoInput.observaciones:
                msg =
                    'Observaciones actualizado -> ${ordenCompraTotales.observaciones} $msg';
                ordenCompraTotales.observaciones = newValue;
                break;
              default:
                msg = "Sin actualizaciones"; // Without this, you see a WARNING.
            }

            NotificationsHelper.showSnacbar(msg);
          },
          loadedByEmpresas: (_) => null,
        );
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _cabecera(context, number),
            _detalle(number),

            //GRABAR O RECHAZAR
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: "btn1",
                  backgroundColor: Colors.red[300],
                  child: const Icon(Icons.close),
                  onPressed: () => updateDisplayInput(
                    context,
                    msgErr: 'Debe ingeresar un motivo de rechazo',
                    tipoInput: TipoInput.rechazada,
                    // title: "Aprobar OC",
                  ),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  child: const Icon(Icons.check),
                  onPressed: () => updateDisplayInput(
                    context,
                    msgErr: 'Estado erroneo',
                    tipoInput: TipoInput.aprobada,
                    // title: "Aprobar OC",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _detalle(NumberFormat number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${ordenCompraTotales.razonSocial}',
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                fontSize: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            border: Border.all(
              color: Colors.black45, // Color del borde
              width: 0.5, // Ancho del borde
            ),
          ),
          padding: const EdgeInsets.all(8.0), //
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text(
                    'Solitado por',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ordenCompraTotales.soliCodsolicitador,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 30, // Ajusta la altura según tus necesidades
                child: VerticalDivider(
                  color: Colors.black45,
                  thickness: 0.5,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Comprador',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ordenCompraTotales.soliCodcomprador,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 30, // Ajusta la altura según tus necesidades
                child: VerticalDivider(
                  color: Colors.black45,
                  thickness: 0.5,
                ),
              ),
              Column(
                children: [
                  const Text(
                    'Fecha OC',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  Text(
                    ordenCompraTotales.fechaCreacion != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(ordenCompraTotales.fechaCreacion!)
                        : '',
                    style: const TextStyle(fontWeight: FontWeight.w400),
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
              child: Text(
                'Obs: ${ordenCompraTotales.observaciones}',
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            ordenCompraTotales.proveNombre,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          '${ordenCompraTotales.proveRutn}-${ordenCompraTotales.proveRutd}',
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 10),

        //D E T A L L E

        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:
                ocDet.isNotEmpty ? ocDet.first.ordenCompraDets.length : 0,
            // itemExtent: 25.0,
            itemBuilder: (context, i) => Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Articulo:"),
                      Flexible(
                        child: Text(
                          '${ocDet.first.ordenCompraDets[i].codArticulo} - ${ocDet.first.ordenCompraDets[i].nomArticulo}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 10), // Espacio vertical entre las filas

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Cantidad:"),
                      Text(
                        NumberFormat('#,##0.00')
                            .format(ocDet.first.ordenCompraDets[i].cantidad),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Monto:"),
                      Text(
                        number.format(ocDet.first.ordenCompraDets[i].totalNeto),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ),
        ),

        //T O T A L E S
        const SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: Colors.black12,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NETO',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        'IVA',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        'ESPECIFICO',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        'EXENTO',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.transparent,
                      ),
                      Text(
                        'TOTAL',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        number.format(ordenCompraTotales.totalNeto),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      // const Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        number.format(ordenCompraTotales.totalIva),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      // const Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        number.format(ordenCompraTotales.totalEspecifico),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      // const Divider(
                      //   thickness: 0.5,
                      //   color: Colors.black45,
                      // ),
                      Text(
                        number.format(ordenCompraTotales.totalExento),
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                      const Divider(
                        thickness: 1.5,
                        color: Colors.black45,
                      ),
                      Text(
                        number.format(ordenCompraTotales.totalBruto),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        //GRABA O RECHAZAR
      ],
    );
  }

  Stack _cabecera(BuildContext context, NumberFormat number) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flecha para ir a la página anterior
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color:
                      Preferences.isDarkmode ? Colors.white70 : Colors.black45,
                ),
              ),
              // Correlativo OC
              Text(
                'OC: ${ordenCompraTotales.correlativo}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              // Ver distribución de Centros de costos
              IconButton(
                icon: Icon(
                  Icons.article_outlined,
                  size: 30,
                  color:
                      Preferences.isDarkmode ? Colors.white70 : Colors.black45,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: const EdgeInsets.all(5.0),
                        backgroundColor: Colors.black26,
                        title: const Text(
                          'Distribución de CeCos',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        content: SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(), // Deshabilita el desplazamiento del ListView interno
                                  scrollDirection: Axis.vertical,
                                  itemCount: ocDet.isNotEmpty
                                      ? ocDet.first.ordenCompraDistCcs.length
                                      : 0,
                                  itemBuilder: (context, index) {
                                    var item =
                                        ocDet.first.ordenCompraDistCcs[index];
                                    return Container(
                                      constraints: const BoxConstraints(
                                        maxHeight: 230,
                                      ),
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Artículo:',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.codArticulo,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'Centro de Costo:',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.ccosto?.descripcion ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text(
                                                'Elemento de Costo:',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  item.elementoCosto
                                                          ?.descripcion ??
                                                      "",
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Monto:',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      number.format(item.monto),
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
