import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/presentation/helpers/menu_option.dart';
import 'package:mi_app/app/presentation/modules_home/home/view/home_view.dart';
import 'package:mi_app/app/presentation/router/app_routes.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';

class SideMenu extends StatelessWidget {
  final String urlLogo;
  const SideMenu({super.key, required this.urlLogo});

  @override
  Widget build(BuildContext context) {
    final menuOption = AppRoutes.menuOptions;
    return Drawer(
      child: Column(
        children: [
          //Cabecera del menu lateral
          _DrawerHeader(urlLogo),

          //Todas la rutas de router
          Expanded(
            child: _ListViewMenu(menuOption: menuOption),
          ),

          const Divider(),

          //Ruta manual para cerrar session
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Apptheme.primary,
            ),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),
    );
  }
}

class _ListViewMenu extends StatelessWidget {
  const _ListViewMenu({
    required this.menuOption,
  });

  final List<MenuOpion> menuOption;

  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();

    return ListView.builder(
        itemBuilder: (context, i) => Visibility(
              visible: _access(sessionProvider.access, menuOption[i].route),
              child: ListTile(
                leading: Icon(
                  menuOption[i].icon,
                  color: Apptheme.primary,
                ),
                title: Text(menuOption[i].name),
                onTap: () {
                  Navigator.pushReplacementNamed(context, menuOption[i].route);
                },
              ),
            ),
        // separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOption.length);
  }

  bool _access(Map<String, bool> access, String route) {
    switch (route) {
      case 'users':
        return ((access['usuarios'] ?? false) ||
            (access['usuariosPlus'] ?? false));
      case 'singup':
        return access['usuariosPlus'] ?? false;

      default:
        return true;
    }
  }
}

class _DrawerHeader extends StatelessWidget {
  final String urlLogo;
  const _DrawerHeader(this.urlLogo);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        // image: const DecorationImage(
        //   image: AssetImage('assets/agrosoft_footer_new.png'),
        //   fit: BoxFit.contain,
        // ),
      ),
      child: Image.network(
        urlLogo,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const CircularProgressIndicator(
            color: Apptheme.primary,
          );
        },
        // width: 40,
        // height: 43,
        fit: BoxFit.contain,
      ),
    );
  }
}
