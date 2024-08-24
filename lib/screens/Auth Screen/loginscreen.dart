import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
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
  bool showBottomSheet = false; // State variable to toggle BottomSheet

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: screenHeight * 0.48, // Responsive height
                  width: double.infinity,
                  color: AppColors.lightblue,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.04), // Responsive padding
                        child: Image.asset(AppImagesPath.linesimage),
                      ),
                      Positioned(
                        bottom: screenHeight * 0.09, // Responsive positioning
                        right: screenWidth * 0.3, // Responsive positioning
                        child: Text(
                          'Mela',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize:
                                screenWidth * 0.12, // Responsive font size
                            color: AppColors.bluescolor,
                            fontFamily: 'Luckiest Guy',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04), // Responsive padding
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical:
                                screenHeight * 0.02), // Responsive padding
                        child: Image.asset(AppImagesPath.logintextimage),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01, // Responsive spacing
                ),
                const TextFieldDesign(
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
                SizedBox(
                  height: screenHeight * 0.02, // Responsive spacing
                ),
                const TextFieldDesign(
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
                SizedBox(
                  height: screenHeight * 0.02, // Responsive spacing
                ),
                CustomButtonDesign(buttonText: 'Login', onPressed: () {}),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.07), // Responsive padding
                  child: Row(
                    children: [
                      const Text(
                        "Don't Have Account?",
                        style:
                            TextStyle(color: AppColors.darkblue, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showBottomSheet = true; // Show BottomSheet
                          });
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                              color: AppColors.bluescolor, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
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
                        bottom: 125,
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
