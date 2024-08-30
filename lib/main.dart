import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/businesshomescreen.dart';
import 'package:mela/BusinessSide/B_Screens/jobdetailsscreen.dart';
import 'package:mela/BusinessSide/B_Screens/myservicesscreen.dart';
import 'package:mela/BusinessSide/B_Screens/upcomingjobs.dart';
import 'package:mela/CustomSide/screens/homescreen.dart';
import 'package:mela/CustomSide/screens/productdetails.dart';
import 'package:mela/CustomSide/screens/productservice.dart';

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
      home: const MyServicesScreen(),
    );
  }
}
