import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'splash_provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationProvider(this.context);
  BuildContext? context;
  // Put your code here
  String firstName = '';

  void setFirstName(String value) {
    firstName = value;
  }

  void setValueToNamed() {
    context!
        .read<SplashProvider>()
        .localStorage!
        .setString('firstName', firstName);

    context!.read<SplashProvider>().firstName = firstName;
  }
}
