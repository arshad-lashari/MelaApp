import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mela/CustomSide/screens/onboarding.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mela/CustomSide/constant/colorspath.dart';
import 'package:mela/CustomSide/constant/imagespath.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();

  @override
  void initState() {
    super.initState();
    // Navigate to the onboarding screen after 10 seconds
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnBordingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.bluescolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImagesPath.splashimage),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mela',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 65,
                color: Colors.white,
                fontFamily: 'Luckiest Guy',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'ethiopia and Eritrean page adverts\n'
              'business’s, products and services',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Ubuntu',
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400],
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
