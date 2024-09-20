import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/splash_provider.dart';
import '../utils/assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    final SplashProvider splashProvider = context.read<SplashProvider>();

    splashProvider.init();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        splashProvider.getNextUserRoute(),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(splashImage),
      ),
    );
  }
}
