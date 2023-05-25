import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/widgets/widgets.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart';

Future<String?> showInputDialogUser(
  BuildContext context, {
  String? title,
  TipoInput? tipoInput,
  required Usuario selectedUser,
}) async {
  final Map<String, String> formValues = {
    'texto': '',
  };

  String texto = "";
  String labelText = "";
  String hintText = "";

  switch (tipoInput) {
    case TipoInput.correo:
      formValues['texto'] = selectedUser.correo;
      labelText = "Correo";
      hintText = "Correo del Usuario";
      break;
    case TipoInput.nombre:
      formValues['texto'] = selectedUser.nombre;
      labelText = "Nombre";
      hintText = "Nombre del Usuario";
      break;
    case TipoInput.rut:
      formValues['texto'] = selectedUser.rut;
      labelText = "Rut";
      hintText = "Rut del Usuario";
      break;
    case TipoInput.estado:
      texto = selectedUser.estado ? 'activo' : 'inactivo';
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
      content: tipoInput != TipoInput.estado
          ? CustomInputField(
              tipoInput: tipoInput,
              textCapitalization: TextCapitalization.words,
              autocorrect: false,
              labelText: labelText,
              hintText: hintText,
              formProperty: 'texto',
              formValues: formValues,
              validator: (val) {
                switch (tipoInput) {
                  case TipoInput.nombre:
                    if (!val.isValidName) {
                      return 'Ingrese un nombre valido ej.:Nom Apell';
                    }
                    break;
                  case TipoInput.rut:
                    if (!val.isRut) {
                      return 'Ingrese un rut valido ej:11111111-1';
                    }
                    break;
                  case TipoInput.dropdownButtonFormField:
                    if (!val.isNotNull) {
                      return 'Seleccione un Rol';
                    }
                    break;
                  default:
                    break;
                }

                return null;
              },
            )
          : ChangeNotifierProvider(
              create: (_) => UserBloc(
                userRepository: context.read(),
              ),
              builder: (context, _) {
                final UserBloc bloc = context.watch();
                bloc.selectedUser = selectedUser;
                return CupertinoSwitch(
                    value: bloc.selectedUser.estado,
                    // title: const Text('Estado'),
                    activeColor: Apptheme.primary,
                    onChanged: (estado) {
                      formValues['texto'] = estado ? 'activo' : 'inactivo';
                      bloc.updateEstado(estado);
                    });
              },
            ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            texto = formValues['texto'].toString();
            Navigator.pop(context, texto);
          },
          // isDefaultAction: true,
          child: const Text("Grabar"),
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
    if (tipoInput == TipoInput.nombre && !result.isValidName) {
      return '';
    } else if (tipoInput == TipoInput.rut && !result.isRut) {
      return '';
    } else if (tipoInput == TipoInput.dropdownButtonFormField &&
        !result.isNotNull) {
      return '';
    }
  }
  return result;
}
