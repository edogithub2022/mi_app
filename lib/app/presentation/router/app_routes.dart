import 'package:mi_app/app/presentation/modules_erp/orden_compra/view/aprobar_oc_list_view.dart';
import 'package:flutter/material.dart';

import 'package:mi_app/app/presentation/helpers/menu_option.dart';
import 'package:mi_app/app/presentation/modules_home/home/view/home_view.dart';
import 'package:mi_app/app/presentation/modules_home/login/view/login_view.dart';
import 'package:mi_app/app/presentation/modules_home/reset_password/view/reset_password_view.dart';
import 'package:mi_app/app/presentation/modules_home/settings/views/settings_view.dart';
import 'package:mi_app/app/presentation/modules_home/singup/view/singup_view.dart';
import 'package:mi_app/app/presentation/modules_home/splash/view/splash_view.dart';
import 'package:mi_app/app/presentation/modules_home/users/views/user_view.dart';
import 'package:mi_app/app/presentation/modules_home/users/views/users_list_view.dart';

class AppRoutes {
  static const initialRoute = 'splash';
  bool access = false;

  static final menuOptions = <MenuOpion>[
    MenuOpion(
        route: 'home',
        name: 'Home',
        screen: const HomeView(),
        icon: Icons.home_outlined),
    MenuOpion(
        route: 'perfil',
        name: 'Perfil de Usuario',
        screen: const UserView(),
        icon: Icons.person),
    MenuOpion(
        route: 'singup',
        name: 'Registrar Usuario',
        screen: const SingUpView(),
        icon: Icons.account_circle_outlined),
    MenuOpion(
        route: 'users',
        name: 'Usuarios',
        screen: const UsersListView(),
        icon: Icons.switch_account_outlined),
    MenuOpion(
        route: 'aprobarOc',
        name: 'Aprobar OC',
        screen: const AprobarOcListView(),
        icon: Icons.check_box_outlined),
    MenuOpion(
        route: 'setting',
        name: 'Ajustes',
        screen: const SettingsView(),
        icon: Icons.settings_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    //Se agrega el home y login para existan si no se podria entrar
    // appRoutes.addAll({'user': (BuildContext context) => const UserView()});
    appRoutes.addAll({'login': (BuildContext context) => const LoginView()});
    appRoutes.addAll({
      'reset_password': (BuildContext context) => const ResetPasswordView()
    });
    appRoutes.addAll({'splash': (BuildContext context) => const SplashView()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  //Esto sirve para cuando no existe una ruta por defecto de va a la que aca se
  //Espcifica
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeView());
  }
}
