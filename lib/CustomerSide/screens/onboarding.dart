import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/Auth%20Screen/loginscreen.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart'; // Adjust import path if necessary

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  AppImagesPath appImagesPath = AppImagesPath();
  int selectedValue = 0;

  void onChanged(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                AppImagesPath.ownerimage,
                height: 235.0,
                width: 235.0,
              ),
              const SizedBox(height: 30.0),
              Image.asset(AppImagesPath.textimage),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<int>(
                    value: 0,
                    groupValue: selectedValue,
                    onChanged: onChanged,
                  ),
                  const Text(
                    'Customer Side',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkblue),
                  ),
                  Radio<int>(
                    activeColor: AppColors.bluescolor,
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: onChanged,
                  ),
                  const Text(
                    'Business Side',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkblue),
                  ),
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CustomButtonDesign(
                  buttonText: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(
                          selectedValue: selectedValue,
                        ),
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
