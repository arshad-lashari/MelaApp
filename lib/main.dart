import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/b_navbarscreen.dart';
import 'package:mela/CustomerSide/screens/onboarding.dart';
import 'package:mela/CustomerSide/screens/splashscreen.dart';

void main() => runApp(
      DevicePreview(
        enabled: kDebugMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Ubuntu"),
      home: const SplashScreen(),
    );
  }
}
