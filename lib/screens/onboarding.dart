import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/Auth%20Screen/loginscreen.dart';
import 'package:mela/screens/customdesign.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.20,
            ),
            Image.asset(
              AppImagesPath.ownerimage,
              height: screenHeight * 0.28, // Responsive height
              width: screenWidth * 0.65, // Responsive width
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Image.asset(AppImagesPath.textimage),
            SizedBox(
              height: screenHeight * 0.24,
            ),
            CustomButtonDesign(
              buttonText: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const LoginScreen()), // Replace with your actual screen
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
