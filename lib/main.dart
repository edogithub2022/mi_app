import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:mi_app/app/data/helpers/http.dart';
import 'package:mi_app/app/data/repositories_impl/repositories_impl.dart';
import 'package:mi_app/app/data/services/remote/remote.dart';
import 'package:mi_app/app/domain/global_provider/session_provider.dart';
import 'package:mi_app/app/domain/repositories/repositories.dart';
import 'package:mi_app/app/my_app.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/theme/providers/theme_provider.dart';

// const String enviroment = "desarrollo";
const String enviroment = "produccion";
const String http = enviroment == 'desarrollo'
    ? 'http://192.168.1.94'
    : 'http://34.229.130.150';
const String portLogin = enviroment == 'desarrollo' ? '8080' : '8082';
const String portERP = enviroment == 'desarrollo' ? '8081' : '8083';

final httpLogin = Http(baseUrl: '$http:$portLogin');
final httpErp = Http(baseUrl: '$http:$portERP');

void main() async {
  //Esto es para que las preferences se inicialicen sin problemas
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  //Esto inicializa la confiuracion regional para el manejo de fechas
  await initializeDateFormatting();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SessionProvider>(create: (_) => SessionProvider()),
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode)),
      Provider<UserRepository>(
        create: (_) => UserRepositoryImpl(
          LoginApi(httpLogin),
        ),
      ),
      Provider<AuthenticationRepository>(
        create: (_) => AuthenticationRepositoryImpl(
          LoginApi(httpLogin),
        ),
      ),
      Provider<ErpRepository>(
        create: (_) => ErpRepositoryImpl(
          ErpApi(httpErp),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}
