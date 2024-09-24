import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/addservice.dart';
import 'package:mela/CustomerSide/screens/homescreen.dart';
import 'package:mela/CustomerSide/screens/productdetails.dart';
import 'package:mela/CustomerSide/screens/productservice.dart';
import 'package:mela/CustomerSide/screens/splashscreen.dart';
import 'package:mela/testing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
