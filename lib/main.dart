import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/authentication_provider.dart';
import 'utils/routes/route_keys.dart';
import 'view/authentication.dart';
import 'view/completed_order.dart';
import 'view/home.dart';
import 'view/splash.dart';
import 'view/track_order.dart';
import 'view/view_item.dart';
import 'view/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          routeSplash: (context) => const Splash(),
          routeHome: (context) => const Home(),
          routeWelcome: (context) => const Welcome(),
          routeAuthentication: (context) => const Authentication(),
          routeCompletedOrder: (context) => const CompletedOrder(),
          routeTrackOrder: (context) => const Track(),
          routeViewItem: (context) => const ViewItem(),
        },
        initialRoute: routeSplash,
      ),
    );
  }
}
