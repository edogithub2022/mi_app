import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    // const HomeForm = Provider.of<HomeBloc>(context).tabController;
    // const HomeForm = context.read();
    return const TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.home_rounded),
        ),
        Tab(
          icon: Icon(Icons.person_rounded),
        )
      ],
      controller: null,
    );
  }
}
