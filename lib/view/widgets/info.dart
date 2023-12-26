import 'package:flutter/material.dart';
import 'package:mobile3/config/asset.dart';

class InfoMessage {
  static snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
        message,
        style: TextStyle(
          color: Asset.colorAccent,
        ),
      )),
    );
  }
}
