import 'package:flutter/material.dart';

class HomeBloc with ChangeNotifier {
  late TabController tabController;

  HomeBloc() {
    tabController = TabController(
      length: 3,
      vsync: NavigatorState(),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
