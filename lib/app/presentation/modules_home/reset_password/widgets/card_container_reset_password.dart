import 'package:flutter/material.dart';
import 'dart:ui';

class CardContainerResetPassword extends StatelessWidget {
  final Widget child;

  const CardContainerResetPassword({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("Restablecer Password",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
        ),

        //Se comento ya que no se veia bien el logo con la imagen de fondo
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 15),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       Image(
        //         image: AssetImage('assets/agrosoft_footer_new.png'),
        //         width: 150,
        //       ),
        //     ],
        //   ),
        // ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
        ),
      ],
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: const Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ]);
}
