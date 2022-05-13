import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(BuildContext context, String text) =>
      // ignore: deprecated_member_use
      Scaffold.of(context)
        // ignore: deprecated_member_use
        ..showSnackBar(const SnackBar(content: Text('deleted')));
}
