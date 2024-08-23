import 'package:flutter/material.dart';
import 'package:mela/screens/onboarding.dart';
import 'package:shimmer/shimmer.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

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
    // Navigate to home screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => OnBordingScreen()), // Replace with your actual home screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.bluescolor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.08), // Adjust padding
                  child: Image.asset(AppImagesPath.splashimage),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.36,
            left: screenWidth * 0.25, // Adjust positioning
            child: const Text(
              'Mela',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 65,
                color: Colors.white,
                fontFamily: 'Luckiest Guy',
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.28, // Adjust positioning
            left: screenWidth * 0.02, // Adjust positioning
            right: screenWidth * 0.02, // Adjust positioning
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
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
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.1, // Adjust positioning
            left: screenWidth * 0.02, // Adjust positioning
            right: screenWidth * 0.02, // Adjust positioning
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!, // Darker grey color for better contrast
                highlightColor: Colors.white,  // Lighter color for the shimmer effect
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[400], // Match base color for shimmer
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
