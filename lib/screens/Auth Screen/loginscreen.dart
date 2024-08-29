import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/Auth%20Screen/signupscreen.dart';
import 'package:mela/screens/bottomnav.dart';
import 'package:mela/screens/customdesign.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();
  bool chekvalue = false;

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return CustomBottomSheet(
          chekvalue: chekvalue,
          onCheckboxChanged: (value) {
            setState(() {
              chekvalue = value!;
            });
          },
          onClose: () {
            Navigator.pop(context);
          },
          onCreateProfile: () {
            Navigator.pop(context); // Handle create profile action
          },
          onLoginNow: () {
            Navigator.pop(context); // Close BottomSheet and show login
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.38,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.lightblue,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AppImagesPath.linesimage,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment(0.1, 0.6),
                    child: Text(
                      "Mela",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: AppColors.bluescolor,
                        fontFamily: "Luckiest Guy",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: Image(
                      image: AssetImage(
                        AppImagesPath.logintextimage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: double.infinity,
                    child: const TextFieldDesign(
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.bluescolor,
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 20,
                            ),
                          )),
                      hintText: 'davidalski@mail.com',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: TextFieldDesign(
                      prefixIcon: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.bluescolor,
                            child: Image(
                                height: 15,
                                width: 15,
                                image: AssetImage(AppImagesPath.keyimage)),
                          )),
                      hintText: '***********',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: CustomButtonDesign(
                            buttonText: 'Login',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomNavBar(),
                                  ));
                            }),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have Account?",
                            style: TextStyle(
                                color: AppColors.darkblue, fontSize: 14),
                          ),
                          TextButton(
                            onPressed: _showBottomSheet,
                            child: const Text(
                              'Register Now',
                              style: TextStyle(
                                  color: AppColors.bluescolor, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
