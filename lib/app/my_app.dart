import 'package:mi_app/app/presentation/theme/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:mi_app/app/presentation/helpers/notifications_helper.dart';
import 'package:mi_app/app/presentation/router/app_routes.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'erp - movil',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      scaffoldMessengerKey: NotificationsHelper.messengerKey,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
