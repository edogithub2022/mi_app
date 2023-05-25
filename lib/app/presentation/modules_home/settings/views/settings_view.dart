import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/theme/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    SessionProvider sessionProvider = context.watch();
    Usuario? usuario = sessionProvider.usuario;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ajustes'),
      ),
      drawer: SideMenu(
        urlLogo: usuario!.urlLogo ??
            'https://res.cloudinary.com/dmpdnoked/image/upload/v1684947001/foo4fd1ptdnn8i1mon5t.png',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
