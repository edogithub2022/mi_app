import 'package:flutter/material.dart';

class AuthBackgroud extends StatelessWidget {
  final Widget child;

  const AuthBackgroud({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          // _OlivaBox(),
          // Image.network(
          //   'https://anmg-production.anmg.xyz/yaza-co-za_sfja9J2vLAtVaGdUPdH5y7gA',
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   fit: BoxFit.cover,
          // ),
          Image(
            image: const AssetImage(
                'assets/Fotolia_65498581_Subscription_XXL.jpg'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        // child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
        // child: const Image(
        //   image: AssetImage('assets/agrosoft_footer_new.png'),
        // ),
      ),
    );
  }
}

// class _OlivaBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Container(
//       width: double.infinity,
//       height: size.height * 0.4,
//       decoration: _olivaBackgroud(),
//       child: Stack(
//         children: [
//           Positioned(top: 90, left: 30, child: _Bubble()),
//           Positioned(top: -40, left: -30, child: _Bubble()),
//           Positioned(top: -50, right: -20, child: _Bubble()),
//           Positioned(bottom: -50, left: 10, child: _Bubble()),
//           Positioned(top: 120, right: 20, child: _Bubble()),
//         ],
//       ),
//     );
//   }

//   BoxDecoration _olivaBackgroud() => const BoxDecoration(
//           gradient: LinearGradient(colors: [
//         Color.fromRGBO(63, 63, 156, 1),
//         Color.fromRGBO(70, 70, 178, 1),
//       ]));
// }

// class _Bubble extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//         color: const Color.fromRGBO(255, 255, 255, 0.05),
//       ),
//     );
//   }
// }
