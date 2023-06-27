import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/widgets/widgets.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/modules_home/users/bloc/bloc.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart';

bool passOK = false;

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
      //SingleChildScrollView : cuadros de imput, nombre, password, etc
      content: SingleChildScrollView(
        child: buildContentWidget(
          tipoInput!,
          labelText,
          hintText,
          formValues,
          selectedUser,
          context,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            texto = tipoInput == TipoInput.password
                ? formValues['password'].toString()
                : formValues['texto'].toString();
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
    } else if (tipoInput == TipoInput.password &&
        (!result.isValidPassword || !passOK)) {
      return '';
    }
  }
  return result;
}

Widget buildContentWidget(
  TipoInput tipoInput,
  String labelText,
  String hintText,
  Map<String, dynamic> formValues,
  Usuario selectedUser,
  BuildContext context,
) {
  if (tipoInput == TipoInput.estado) {
    return ChangeNotifierProvider(
      create: (_) => UserBloc(
        userRepository: context.read(),
      ),
      builder: (context, _) {
        final UserBloc bloc = context.watch();
        bloc.selectedUser = selectedUser;
        return CupertinoSwitch(
          value: bloc.selectedUser.estado,
          activeColor: Apptheme.primary,
          onChanged: (estado) {
            formValues['texto'] = estado ? 'activo' : 'inactivo';
            bloc.updateEstado(estado);
          },
        );
      },
    );
  }

  if (tipoInput == TipoInput.password) {
    return Column(
      children: [
        CustomInputField(
          labelText: "Password",
          hintText: "Password del Usuario",
          obscureText: true,
          suffixIcon: Icons.visibility,
          formProperty: 'password',
          formValues: formValues,
          validator: (val) {
            if (!val.isValidPassword) {
              return 'De largo 6, entre May,Min  y un !@#><*~';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomInputField(
          labelText: "Verificación de Password",
          hintText: "Verificación",
          obscureText: true,
          suffixIcon: Icons.visibility,
          formProperty: 'vPassword',
          formValues: formValues,
          validator: (val) {
            if (formValues['password'].toString() != val) {
              return 'La contraseña no coincide';
            }
            if (!val.isValidPassword) {
              return 'De largo 6, entre May,Min  y un !@#><*~';
            }
            passOK = true;
            return null;
          },
        ),
      ],
    );
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
  );
}
