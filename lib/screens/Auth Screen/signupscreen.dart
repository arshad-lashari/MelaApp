import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/customdesign.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    bool chekvalue = false;
  bool showBottomSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (showBottomSheet)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showBottomSheet = false; // Hide BottomSheet on tap
                  });
                },
                child: Container(
                  height: 645,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(34),
                        topRight: Radius.circular(34)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child:
                                  Image.asset(AppImagesPath.createaccountimage),
                            ),
                            Image.asset(AppImagesPath.wlcomsignupimage),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 55,
                              child: TextFieldDesign(
                                hintText: 'David Kowlaski',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.bluescolor,
                                    child: Image.asset(
                                        height: 25,
                                        width: 25,
                                        AppImagesPath.manimage),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 55,
                              child: TextFieldDesign(
                                hintText: 'DavidKowi@gmail.com',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.bluescolor,
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 55,
                              child: TextFieldDesign(
                                hintText: '904993933939',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.bluescolor,
                                    child: Image.asset(
                                        height: 25,
                                        width: 25,
                                        AppImagesPath.manimage),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 50,
                              child: TextFieldDesign(
                                hintText: 'Adress',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.bluescolor,
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 55,
                              child: TextFieldDesign(
                                hintText: 'City',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.bluescolor,
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 50,
                              child: TextFieldDesign(
                                hintText: 'Zip_Code',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(9.0),
                                  child: CircleAvatar(
                                      backgroundColor: AppColors.bluescolor,
                                      child: Icon(
                                        Icons.location_on,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 62,
                            ),
                            SizedBox(
                              height: 55,
                              child: CustomButtonDesign(
                                  buttonText: 'Create Profile',
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              child: Row(
                                children: [
                                  const Text(
                                    "Already Have Account?",
                                    style: TextStyle(
                                        color: AppColors.darkblue,
                                        fontSize: 14),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showBottomSheet =
                                            false; // Show BottomSheet
                                      });
                                    },
                                    child: const Text(
                                      'Login Now',
                                      style: TextStyle(
                                          color: AppColors.bluescolor,
                                          fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 120,
                          left: 0,
                          child: SizedBox(
                            height: 52,
                            width: 52,
                            child: Checkbox(
                              activeColor: Colors.blueAccent,
                              checkColor: Colors.white, // Add this line
                              focusColor: Colors.black, // Add this line
                              hoverColor: Colors.black12, // Add this line
                              side: const BorderSide(
                                  width: 1,
                                  color: Colors.black), // Add this line
                              value: chekvalue,
                              onChanged: (value) {
                                setState(() {
                                  chekvalue = value!;
                                });
                              },
                            ),
                          )),
                      Positioned(
                        bottom: 126,
                        left: 45,
                        child: Image.asset(AppImagesPath.byclickingimage),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}