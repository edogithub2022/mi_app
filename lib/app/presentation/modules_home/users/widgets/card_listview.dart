import 'package:flutter/material.dart';
import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';

class CardListView extends StatelessWidget {
  final Usuario usuario;
  final Widget child;

  const CardListView({
    super.key,
    required this.child,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 8),
          child: Container(
            // margin: const EdgeInsets.only(
            //   top: 0,
            // ),
            width: double.infinity,
            height: 70,
            decoration: _cardBorders(),
            child: Stack(
              children: [
                child,
                Positioned(
                  top: 0,
                  right: 0,
                  child: _Estado(estado: usuario.estado),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: Text(
                    usuario.rol,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Preferences.isDarkmode ? Colors.white60 : Colors.black54,
        ),
      ],
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
      color: Preferences.isDarkmode ? Colors.black12 : Colors.white54,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(45),
        topLeft: Radius.circular(45),
        topRight: Radius.circular(15),
      ),
      // boxShadow: [
      //   BoxShadow(
      //     color: Preferences.isDarkmode ? Colors.white12 : Colors.white70,
      //     offset: const Offset(0, 5),
      //     blurRadius: 6,
      //   )
      // ],
    );
  }
}

class _Estado extends StatelessWidget {
  final bool estado;

  const _Estado({required this.estado});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: Color.fromRGBO(255, 160, 0, 1),
        color: estado
            ? const Color(0xffd1e299)
            : Preferences.isDarkmode
                ? Colors.grey[300]
                : Colors.black12,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            estado ? 'Activo' : 'Inactivo',
            style: const TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
