import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes/route_keys.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider(this.context);
  BuildContext? context;
  SharedPreferences? localStorage;
  String? firstName;

  Future<void> init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  String getNextUserRoute() {
    firstName = localStorage!.getString('firstName');
    if (firstName == null) {
      return routeWelcome;
    } else {
      return routeHome;
    }
  }
}
