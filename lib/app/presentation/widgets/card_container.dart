import 'dart:ui';

import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: _createCardShape(),
            child: child,
          ),
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
        // color: const Color.fromARGB(255, 202, 223, 187).withOpacity(0.5),
        color: Preferences.isDarkmode
            ? Colors.white.withOpacity(0.3)
            : Apptheme.primary.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      );
}
