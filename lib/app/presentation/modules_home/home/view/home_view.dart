import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/models/login/usuario.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:mi_app/app/presentation/widgets/widgets.dart';

Future logout() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'token');
  return;
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    Usuario? usuario = sessionProvider.usuario;
    var indexBtnNav = sessionProvider.indexBtnNav;

    final tabs = [
      Center(child: _Home()),
      const Center(child: Text('Notificaciones')),
      const Center(child: Text('Solicítelo al área Comercial')),
    ];

    //Recupera datos del usuario de provider y
    //realiza un split para obtener el primer caracter del
    //nombre y el apellido
    final displayName = usuario!.nombre;
    final List<String> listName =
        displayName.isNotEmpty ? displayName.split(' ') : [];
    final String letter;
    if (listName.length > 3) {
      letter = listName[0][0] + listName[2][0];
    } else if (listName.length > 1) {
      letter = listName[0][0] + listName[1][0];
    } else {
      letter = listName[0][0];
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${usuario.holding} - Movil'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: const Color(0xffd1e299),
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.only(bottom: 0.0),
                child: _getImage(usuario.imageUrl, letter),
              ),
            ),
          )
        ],
      ),
      drawer: SideMenu(
        urlLogo: usuario.urlLogo ??
            'https://res.cloudinary.com/dmpdnoked/image/upload/v1684947001/foo4fd1ptdnn8i1mon5t.png',
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: tabs[indexBtnNav],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget _getImage(String? picture, String letter) {
    if (picture == null || picture == '') {
      return Text(letter.toUpperCase(),
          style: const TextStyle(
            color: Color.fromRGBO(255, 160, 0, 1),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    }

    return ClipOval(
      child: Image.network(
        picture,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return const CircularProgressIndicator(
            color: Apptheme.primary,
          );
        },
        width: 40,
        height: 43,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    Usuario? usuario = sessionProvider.usuario;

    final displayName = usuario?.nombre ?? '';

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(displayName),
          const Text('Bienvenido a MiApp.Movil'),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Rol: ${usuario!.rol}',
                style: const TextStyle(fontSize: 10),
              ),
              Text(
                'Modo Dark : ${Preferences.isDarkmode ? 'Activado' : 'Desactivado'}',
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    var indexBtnNav = sessionProvider.indexBtnNav;

    return BottomNavigationBar(
      currentIndex: indexBtnNav,
      selectedItemColor: Apptheme.primary,
      selectedFontSize: 15,
      // iconSize: 28,
      items: [
        const BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Notificaciones',
          icon: Stack(children: [
            const Icon(Icons.notifications_none),
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  alignment: Alignment.center,
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 7),
                  ),
                ))
          ]),
        ),
        const BottomNavigationBarItem(
          label: 'Agrotarja',
          icon: Icon(Icons.grass),
        ),
      ],
      onTap: (index) {
        sessionProvider.setIndexBtnNav(indexBtnNav: index);
      },
    );
  }
}
