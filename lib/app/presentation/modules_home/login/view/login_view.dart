import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/helpers/loaded_user_session.dart';
import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart';
import 'package:mi_app/app/presentation/modules_home/login/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_home/login/widgets/widgets.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        //Esto es para esconder el teclado al tocar l pantalla
        onTap: () => FocusScope.of(context).unfocus(),
        child: AuthBackgroud(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),

                // Formulario
                CardContainerLogin(
                  child: Column(
                    children: [
                      ChangeNotifierProvider(
                        create: (_) => LoginBloc(
                          authenticationRepository: context.read(),
                        ),
                        child: _LoginForm(),
                      )
                    ],
                  ),
                ),

                //Texto
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'reset_password'),
                  style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          Colors.indigo.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  child: const Text(
                    "¿ Has olvidado tu contraseña ?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginBloc>(context);
    final LoginBloc bloc = context.watch();

    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          //Logo
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: AssetImage('assets/agrosoft_footer_new.png'),
                width: 150,
              ),
            ],
          ),

          //Formulario
          CustomInputField(
            autocorrect: false,
            labelText: "Correo",
            hintText: "Correo del Usuario",
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.alternate_email_rounded,
            formProperty: 'correo',
            formValues: loginForm.formValues,
            fondoOscuro: "si",
            validator: (val) {
              if (val != null && !val.isValidEmail) {
                return 'Ingrese un correo valido';
              }
              return null;
            },
          ),

          const SizedBox(height: 25),

          CustomInputField(
              labelText: "Password",
              hintText: "Password del Usuario",
              obscureText: true,
              prefixIcon: Icons.lock_outline,
              suffixIcon: Icons.visibility,
              formProperty: 'password',
              formValues: loginForm.formValues,
              fondoOscuro: "si",
              validator: (val) {
                return (val != null && val.length >= 6)
                    ? null
                    : 'La pass deber ser minimo 6 caracteres';
              }),

          const SizedBox(height: 25),

          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Apptheme.primary,
            onPressed: bloc.state is LoginStateLoading
                ? null
                : () async {
                    //Cerrar teclado
                    //cuando se emula con chrome se cae
                    FocusScope.of(context).unfocus();

                    // Lanza las validaciones
                    if (!loginForm.isValidForm()) return;

                    ProgressDialog.show(context);
                    await loginForm.submit(
                      loginForm.formValues['correo'].toString(),
                      loginForm.formValues['password'].toString(),
                    );
                    //el Navigator.pop(context) destruye el
                    //ProgressDialog.show(context)
                    // ignore: use_build_context_synchronously
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
                      loaded: (usuario) async {
                        //Guarda el usuario autenticado mas control de roles
                        await loadedUserSession(context, usuario: usuario);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, 'home');
                      },
                      inicia: () {},
                    );
                  },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              //poner esatdo
              child: Text(
                bloc.state is LoginStateLoading ? 'Espere...' : 'Ingresar',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
