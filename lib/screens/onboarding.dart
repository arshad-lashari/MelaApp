import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/Auth%20Screen/loginscreen.dart';
import 'package:mela/screens/customdesign.dart'; // Adjust import path if necessary

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  AppImagesPath appImagesPath = AppImagesPath();

  @override
  void initState() {
    super.initState();
    // Timer to navigate to another screen after 10 seconds
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 20.0), // Fixed padding
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                AppImagesPath.ownerimage,
                height: 235.0,
                width: 235.0,
              ),
              const SizedBox(height: 30.0),
              Image.asset(
                  AppImagesPath.textimage), // Replace with your asset path
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CustomButtonDesign(
                  buttonText: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
