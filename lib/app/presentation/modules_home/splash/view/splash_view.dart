import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/presentation/helpers/loaded_user_session.dart';
import 'package:mi_app/app/domain/failures/http_request_failure.dart';
import 'package:mi_app/app/presentation/modules_home/home/view/home_view.dart';
import 'package:mi_app/app/presentation/modules_home/login/view/login_view.dart';
import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/modules_home/splash/bloc/bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashBloc(
        splashRepository: context.read(),
      )..init(),
      builder: (context, __) {
        // final loginForm = Provider.of<LoginBloc>(context);

        final SplashBloc bloc = context.watch();
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: FutureBuilder(
              // future: authService.readVeriyToken(),

              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                final state = bloc.state;
                // print(state);

                state.when(error: (errors) {
                  final String msg = errors
                      .toString()
                      .replaceAll("body[", "\n")
                      .replaceAll("[", "")
                      .replaceAll("]", "");
                  Future.microtask(() {
                    NotificationsHelper.showSnacbar(msg);
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginView(),
                          transitionDuration: const Duration(seconds: 0)),
                    );
                  });
                }, failed: (failure) {
                  Future.microtask(() {
                    if (failure.name != HttpRequestFailure.notoken.name) {
                      NotificationsHelper.showSnacbar(
                          'Su sesión expiro!!!, Vuelva a iniciar sesión Nuevamente.');
                    }

                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const LoginView(),
                          transitionDuration: const Duration(seconds: 0)),
                    );
                  });
                }, loaded: (usuario) {
                  Future.microtask(() {
                    //Guarda el usuario autenticado mas control de roles
                    loadedUserSession(context, usuario: usuario);

                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const HomeView(),
                          transitionDuration: const Duration(seconds: 0)),
                    );
                  });
                }, loading: () {
                  // Future.microtask(() {

                  // });
                });

                return const Center(
                  child: CircularProgressIndicator(
                    color: Apptheme.primary,
                  ),
                );
              },
            ),
          ),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
