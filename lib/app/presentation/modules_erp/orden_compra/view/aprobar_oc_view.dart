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
    //.copy para romper la referencia y no afecte hasta que persista en la bd
    bloc.selectedOrdenCompraTotales = ordenCompraTotales.copy();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ListView(
        children: [
          // const SizedBox(height: 10),

          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //Titulo
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Column(
                  children: [
                    Text(
                      ordenCompraTotales.proveNombre,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        '${ordenCompraTotales.proveRutn}-${ordenCompraTotales.proveRutd}')
                  ],
                ),
              ),
              //Flecha para ir a la pagina anterior
              Positioned(
                top: -12,
                left: 10,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Preferences.isDarkmode
                        ? Colors.white70
                        : Colors.black45,
                  ),
                ),
              ),

              Positioned(
                top: 0,
                right: 10,
                child: Text(
                  'OC: ${ordenCompraTotales.correlativo}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          //Datos OC
          _ModificaOC(
            ordenCompraTotales: ordenCompraTotales,
            ocDet: ocDet,
          )
        ],
      ),
    );
  }
}

class _LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const _LabelButton({
    required this.label,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.00,
      child: ListTile(
        // dense: true,
        // visualDensity: const VisualDensity(vertical: -4),

        onTap: onPressed,
        // contentPadding: const EdgeInsets.only(top: 20),
        leading: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Icon(
              Icons.chevron_right_outlined,
              size: 25,
              color: getColorIconOnPressed(onPressed),
            ),
          ],
        ),
      ),
    );
  }

  Color getColorIconOnPressed(VoidCallback? onPressed) {
    if (onPressed == null) return Colors.transparent;

    if (Preferences.isDarkmode) return Colors.white;

    return Colors.black45;
  }
}

class _ModificaOC extends StatelessWidget {
  final OrdenCompraTotales ordenCompraTotales;
  final List<OrdenCompraCab> ocDet;

  const _ModificaOC({
    required this.ordenCompraTotales,
    required this.ocDet,
  });

  @override
  Widget build(BuildContext context) {
    //Para dar formato a los montos pesos o dolar
    NumberFormat number =
        numberFormat(codmoneda: ordenCompraTotales.codmoneda ?? 1);
    final OrdenCompraBloc bloc = context.watch();

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
        );
      }
    }

    return Column(
      children: [
        //Datos OC
        // const SizedBox(height: 10),
        _LabelButton(
          label: ordenCompraTotales.razonSocial ?? "",
          value: "",
        ),
        _LabelButton(
          label: 'Fecha OC',
          value: ordenCompraTotales.fechaCreacion != null
              ? DateFormat('dd/MM/yyyy')
                  .format(ordenCompraTotales.fechaCreacion!)
              : '',
        ),
        _LabelButton(
          label: 'Solicitado por',
          value: ordenCompraTotales.soliCodsolicitador,
        ),
        _LabelButton(
          label: 'Comprador',
          value: ordenCompraTotales.soliCodcomprador,
        ),

        const SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: const BoxDecoration(
              // border: Border.all(width: 1, color: Colors.black26),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalle',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    // itemExtent: 25.0,
                    itemBuilder: (context, i) => Card(
                      child: ListTile(
                        title: Wrap(
                          // spacing: 1.0, // gap between adjacent chips
                          // runSpacing: 4.0, // gap between lines
                          children: [
                            Text(
                              ocDet.first.ordenCompraDets[i].codArticulo
                                  .toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${ocDet.first.ordenCompraDets[i].nomArticulo}, ',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              NumberFormat('#,##0.00').format(
                                  ocDet.first.ordenCompraDets[i].cantidad),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        trailing: Text(
                          number
                              .format(ocDet.first.ordenCompraDets[i].totalNeto),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    // separatorBuilder: (_, __) => const Divider(),
                    itemCount: ocDet.first.ordenCompraDets.length,
                    // separatorBuilder: (BuildContext context, int index) {
                    //   return const Divider(
                    //     height: 1.0,
                    //     thickness: 1.5,
                    //     indent: 20,
                    //     endIndent: 20,
                    //   );
                    // },
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
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 10),
        _LabelButton(
          label: 'Total Neto',
          value: number.format(ordenCompraTotales.totalNeto),
          onPressed: null,
          // sessionProvider.access['usuariosPlus'] ?? false
          // ? () => updateDisplayInput(
          //       context,
          //       msgErr: 'Ingrese un Rol valido',
          //       tipoInput: TipoInput.dropdownButtonFormField,
          //       title: "Ingrese nuevo Rol:",
          //     )
          // : null,
        ),
        _LabelButton(
          label: 'Total IVA',
          value: number.format(ordenCompraTotales.totalIva),
        ),
        _LabelButton(
          label: 'Impuesto Especifico',
          value: number.format(ordenCompraTotales.totalEspecifico),
        ),
        _LabelButton(
          label: 'Total Exento',
          value: number.format(ordenCompraTotales.totalExento),
        ),
        const SizedBox(height: 10),
        _LabelButton(
          label: 'TOTAL',
          value: number.format(ordenCompraTotales.totalBruto),
        ),

        const SizedBox(height: 30),
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
    );
  }
}
