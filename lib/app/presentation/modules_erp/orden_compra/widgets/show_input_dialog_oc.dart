import 'package:flutter/material.dart';

import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';
import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart';

Future<String?> showInputDialogOc(
  BuildContext context, {
  String? title,
  TipoInput? tipoInput,
  required OrdenCompraTotales selectedOCtot,
}) async {
  final Map<String, String> formValues = {
    'texto': '',
  };

  String texto = "";
  String labelText = "";
  String hintText = "";

  switch (tipoInput) {
    case TipoInput.observaciones:
      formValues['texto'] = selectedOCtot.observaciones;
      labelText = "Obs";
      hintText = "Observaciones";
      break;
    case TipoInput.rechazada:
      formValues['texto'] = '';
      labelText = "Motivo Rechazo";
      hintText = "Ingrese motivo de rechazo";
      break;
    default:
      "";
  }

  final result = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: title != null
          ? Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            )
          : null,
      content: _tipoInput(tipoInput, formValues, labelText, hintText),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            texto = tipoInput == TipoInput.aprobada
                ? 'APROBADA'
                : formValues['texto'].toString();
            Navigator.pop(context, texto);
          },
          // isDefaultAction: true,
          child: Text(
            tipoInput == TipoInput.aprobada ? "Aprobar" : "Rechazar",
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          // isDestructiveAction: true,
          child: const Text("Cancelar", style: TextStyle(color: Colors.red)),
        )
      ],
    ),
  );

  if (result != null && result.trim().isEmpty) {
    return '';
  }

  if (result != null) {
    if (tipoInput == TipoInput.observaciones && !result.isNotNull) {
      return '';
    } else if (tipoInput == TipoInput.rechazada && !result.isNotNull) {
      return '';
    } else if (tipoInput == TipoInput.dropdownButtonFormField &&
        !result.isNotNull) {
      return '';
    }
  }
  return result;
}

Widget _tipoInput(
  TipoInput? tipoInput,
  Map<String, String> formValues,
  String labelText,
  String hintText,
) {
  if (tipoInput == TipoInput.aprobada) {
    return const Text('Aprueba Orden de Compra?');
  }

  return CustomInputField(
    tipoInput: tipoInput,
    textCapitalization: TextCapitalization.words,
    autocorrect: false,
    labelText: labelText,
    hintText: hintText,
    formProperty: 'texto',
    formValues: formValues,
    validator: (val) {
      switch (tipoInput) {
        case TipoInput.observaciones:
          if (!val.isNotNull) {
            return 'Ingrese una obseracion';
          }
          break;
        case TipoInput.rechazada:
          if (val!.isEmpty) {
            return 'Ingrese un motivo de rechazo';
          }
          break;
        default:
          break;
      }

      return null;
    },
  );
}
