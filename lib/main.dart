import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mela/screens/Auth%20Screen/loginscreen.dart';
import 'package:mela/screens/homescreen.dart';
import 'package:mela/screens/messagescreen.dart';
import 'package:mela/screens/paymentsuccesfull.dart';
import 'package:mela/screens/productdetails.dart';
import 'package:mela/screens/productservice.dart';
import 'package:mela/screens/rateandreview.dart';
import 'package:mela/screens/splashscreen.dart';
import 'package:mela/screens/userprofile.dart';
import 'package:mela/screens/workcomplete.dart';

void main() => runApp(
      DevicePreview(
        enabled: kDebugMode,
        builder: (context) => MyApp(), // Wrap your app
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
      ),
      home: const LoginScreen(),
    );
  }
}
