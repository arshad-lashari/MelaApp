import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:mela/CustomerSide/screens/splashscreen.dart';

void main() => runApp(
      DevicePreview(
        enabled: kDebugMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
/// aj shkela ia thi i the?? yha ghr phr chli ge ai q the phrapni khla k sth ai thi or aj mjy us sy nafrt ho ge
/// wallah kun esa kia hova bass kuch ni ap is bat ko chory ap ya batyn ap k sab account kab ho gy complet
/// bs filhal 2 gigs kaafi h ab ap ke bnani h 
/// or suny wo sadia ko kaam start krvana h?? g kal or acha ya bi jaldi ho jay ga bad my ham add karty rhy ap ya bna lyn gy
/// koi nh ahista ahista sb hojay ga don't worryni ap wala bna lyn aj
///  bn jay ga kab thorda thorda kr k bnana h profile ko best kr k bnana h to 1 ee time me thordi bn'na hbass page bna lyn jesy wo
/// mara op ho rha ha kon sa ap dkha dy apny wala me kro udhr connect ap ko kary
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
