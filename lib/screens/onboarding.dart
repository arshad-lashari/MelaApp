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
              const SizedBox(
                height: 30.0,
              ),
              Image.asset(AppImagesPath.textimage),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CustomButtonDesign(
                  buttonText: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
