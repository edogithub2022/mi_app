import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/helpers/regext_string.dart'
    show ExtString;
import 'package:mi_app/app/presentation/modules_home/reset_password/bloc/bloc.dart';
import 'package:mi_app/app/presentation/modules_home/reset_password/widgets/widgets.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        //Esto es para esconder el teclado al tocar l pantalla
        onTap: () => FocusScope.of(context).unfocus(),
        child: ResetPasswordBackgroud(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Fomulario
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CardContainerResetPassword(
                    child: ChangeNotifierProvider(
                      create: (_) => ResetPasswordBloc(
                        authenticationRepository: context.read(),
                      ),
                      child: _ResetPasswordForm(),
                    ),
                  ),
                ),

                //Texto
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'login'),
                  style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(
                          Colors.indigo.withOpacity(0.1)),
                      shape: MaterialStateProperty.all(const StadiumBorder())),
                  child: const Text(
                    "¿ Volver al login ?",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                //Texto
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Luego del envio del mail tiene 5 minutos para realizar el cambio de password.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ResetPasswordForm extends StatefulWidget {
  @override
  State<_ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<_ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final resetPasswordForm = Provider.of<ResetPasswordBloc>(context);
    final ResetPasswordBloc bloc = context.watch();

    return Form(
      key: resetPasswordForm.formKey,
      child: Column(children: [
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
          formValues: resetPasswordForm.formValues,
          fondoOscuro: "si",
          validator: (val) {
            if (val != null && !val.isValidEmail) {
              return 'Ingrese un correo valido';
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
          onPressed: bloc.state is ResetPasswordStateLoading
              ? null
              : () async {
                  //Cerrar teclado
                  //cuando se emula con chrome se cae
                  FocusScope.of(context).unfocus();

                  // Lanza las validaciones
                  if (!resetPasswordForm.isValidForm()) return;

                  ProgressDialog.show(context);
                  await resetPasswordForm.submit(
                    resetPasswordForm.formValues['correo'].toString(),
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
                      NotificationsHelper.showSnacbar(
                          "Revise su correo electronico");
                      Navigator.pushReplacementNamed(context, 'login');
                    },
                    inicia: () {},
                  );
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              bloc.state is ResetPasswordStateLoading ? 'Espere ...' : 'Enviar',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(height: 30),
      ]),
    );
  }
}
