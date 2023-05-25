import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void displayDialogIOS(BuildContext context, errorMessage) {
  showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Error'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const FlutterLogo(
            //   size: 34,
            // ),
            Text(errorMessage),
            const SizedBox(
              height: 10,
            ),
            // const SizedBox(height: 10),
          ],
        ),
        actions: [
          // TextButton(
          //   onPressed: () => Navigator.pop(context),
          //   child: const Text(
          //     "Cancelar",
          //     style: TextStyle(color: Colors.red),
          //   ),
          // ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Ok"),
          )
        ],
      );
    },
  );
}
