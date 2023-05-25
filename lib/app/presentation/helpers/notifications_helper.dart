import 'package:flutter/material.dart';

class NotificationsHelper {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnacbar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.black45,
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
