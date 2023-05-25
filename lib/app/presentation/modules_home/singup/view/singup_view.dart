import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/modules_home/singup/bloc/bloc.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart'
    show ExtString;

class SingUpView extends StatelessWidget {
  const SingUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    Usuario? usuario = sessionProvider.usuario;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registrar Usuario"),
      ),
      drawer: SideMenu(
        urlLogo: usuario!.urlLogo as String,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CardContainer(
                child: ChangeNotifierProvider(
                  create: (_) => SingUpBloc(
                    authenticationRepository: context.read(),
                  ),
                  child: _SingUpForm(),
                ),
              )),
        ),
      ),
    );
  }
}

class _SingUpForm extends StatefulWidget {
  @override
  State<_SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<_SingUpForm> {
  @override
  Widget build(BuildContext context) {
    final singUpForm = Provider.of<SingUpBloc>(context);
    final SingUpBloc bloc = context.watch();

    return Form(
      key: singUpForm.formKey,
      child: Column(children: [
        CustomInputField(
          textCapitalization: TextCapitalization.words,
          labelText: "Nombre",
          hintText: "Nombre del Usuario",
          formProperty: 'nombre',
          formValues: singUpForm.formValues,
          validator: (val) {
            if (!val.isValidName) {
              return 'Ingrese un nombre valido ej.:Nom Apell';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomInputField(
          labelText: "Rut",
          hintText: "Rut del Usuario 11111111-1",
          formProperty: 'rut',
          formValues: singUpForm.formValues,
          validator: (val) {
            if (!val.isRut) {
              return 'Ingrese un rut valido ej:11111111-1';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomInputField(
          autocorrect: false,
          labelText: "Correo",
          hintText: "Correo del Usuario",
          keyboardType: TextInputType.emailAddress,
          formProperty: 'correo',
          formValues: singUpForm.formValues,
          validator: (val) {
            if (val != null && !val.isValidEmail) {
              return 'Ingrese un correo valido';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        CustomInputField(
          labelText: "Password",
          hintText: "Password del Usuario",
          obscureText: true,
          suffixIcon: Icons.visibility,
          formProperty: 'password',
          formValues: singUpForm.formValues,
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
          formValues: singUpForm.formValues,
          validator: (val) {
            if (singUpForm.formValues['password'].toString() != val) {
              return 'La contraseña no coincide';
            }
            if (!val.isValidPassword) {
              return 'De largo 6, entre May,Min  y un !@#><*~';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          dropdownColor: Preferences.isDarkmode ? Colors.white : null,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
          ),
          hint: Text(
            "Seleccione un Rol de usuario",
            style: Preferences.isDarkmode
                ? const TextStyle(color: Colors.black)
                : null,
          ),
          items: [
            DropdownMenuItem(
                value: 'SUPERADMIN_ROLE',
                child: Text(
                  'SUPERADMIN_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'ADMIN_ROLE',
                child: Text(
                  'ADMIN_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'USER_ROLE',
                child: Text(
                  'USER_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'GUEST_ROLE',
                child: Text(
                  'GUEST_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
          ],
          onChanged: (value) {
            singUpForm.formValues['rol'] = value ?? 'USER_ROLE';
          },
          validator: (value) {
            if (!value.isNotNull) {
              return 'Seleccione un Rol';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledColor: Colors.grey,
          elevation: 0,
          color: Apptheme.primary,
          onPressed: bloc.state is SingUpStateLoading
              ? null
              : () async {
                  //Cerrar teclado
                  //cuando se emula con chrome se cae
                  FocusScope.of(context).unfocus();

                  // Lanza las validaciones
                  if (!singUpForm.isValidForm()) return;

                  ProgressDialog.show(context);
                  await singUpForm.submit(
                    singUpForm.formValues['nombre'].toString(),
                    singUpForm.formValues['rut'].toString(),
                    singUpForm.formValues['correo'].toString(),
                    singUpForm.formValues['password'].toString(),
                    singUpForm.formValues['rol'].toString(),
                    null,
                    null,
                  );

                  if (!mounted) {
                    return;
                  }
                  Navigator.pop(context);

                  final state = bloc.state;

                  state.when(
                    loading: () => '',
                    failed: (failure) =>
                        NotificationsHelper.showSnacbar(failure.name),
                    error: (errors) {
                      final String msg = errors
                          .toString()
                          .replaceAll("body[", "\n")
                          .replaceAll("[", "")
                          .replaceAll("]", "");
                      displayDialogIOS(context, msg);
                    },
                    loaded: (usuario) {
                      NotificationsHelper.showSnacbar("Usuario Registrado");
                      Navigator.pushReplacementNamed(context, 'home');
                    },
                    inicia: () {},
                  );
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              bloc.state is SingUpStateLoading ? 'Espere ...' : 'Enviar',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
          style: ButtonStyle(
              overlayColor:
                  MaterialStatePropertyAll(Colors.indigo.withOpacity(0.1)),
              shape: MaterialStateProperty.all(const StadiumBorder())),
          child: const Text(
            "¿ Ya tienes una cuenta ?",
            style: TextStyle(fontSize: 18, color: Apptheme.primaryText),
          ),
        )
      ]),
    );
  }
}
