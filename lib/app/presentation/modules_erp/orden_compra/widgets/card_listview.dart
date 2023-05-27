import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mi_app/app/domain/models/models.dart';
import 'package:mi_app/app/presentation/helpers/number_format.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';

class CardListView extends StatelessWidget {
  final OrdenCompraTotales ordenCompraTotal;
  final Widget child;

  const CardListView({
    super.key,
    required this.child,
    required this.ordenCompraTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(height: 10),
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 8),
          child: Container(
            // margin: const EdgeInsets.only(
            //   top: 0,
            // ),
            width: double.infinity,
            height: 250,
            decoration: _cardBorders(),
            child: Stack(
              children: [
                child,
                Positioned(
                  top: 0,
                  right: 60,
                  child: _Oc(
                    oc: ordenCompraTotal.correlativo.toString(),
                    razonSocial: ordenCompraTotal.razonSocial.toString(),
                  ),
                ),
                Positioned(
                  top: 220,
                  right: 0,
                  child: _Total(
                    total: ordenCompraTotal.totalBruto,
                    codmoneda: ordenCompraTotal.codmoneda ?? 1,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 2,
                  child: Text(
                    ordenCompraTotal.estadoRecepcion,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
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
      color: Preferences.isDarkmode ? Colors.black12 : Colors.white,
      borderRadius: const BorderRadius.only(
        // bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
        topLeft: Radius.circular(15),
        // topRight: Radius.circular(15),
      ),
      boxShadow: [
        BoxShadow(
          color: Preferences.isDarkmode
              ? Colors.white12
              : const Color.fromRGBO(209, 196, 233, 1),
          offset: const Offset(0, 6),
          blurRadius: 4,
        )
      ],
    );
  }
}

class _Total extends StatelessWidget {
  final double total;
  final int codmoneda;

  const _Total({required this.total, required this.codmoneda});
  @override
  Widget build(BuildContext context) {
    NumberFormat number = numberFormat(codmoneda: codmoneda);

    return Container(
      width: 140,
      height: 30,
      alignment: Alignment.centerRight,
      decoration: const BoxDecoration(
        // color: Color.fromRGBO(255, 160, 0, 1),
        color: Color(0xffd1e299),
        borderRadius: BorderRadius.only(
          // topRight: Radius.circular(15),
          // bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            number.format(total),
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class _Oc extends StatelessWidget {
  final String oc;
  final String razonSocial;

  const _Oc({required this.oc, required this.razonSocial});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 30,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        // color: Color.fromRGBO(255, 160, 0, 1),
        color: Color(0xffd1e299),
        borderRadius: BorderRadius.only(
          // topRight: Radius.circular(15),
          // bottomLeft: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OC : $oc ($razonSocial)',
            style: const TextStyle(color: Colors.red, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
