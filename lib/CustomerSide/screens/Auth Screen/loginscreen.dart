import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mela/BusinessSide/B_Screens/b_navbarscreen.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/bottomnav.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';

class LoginScreen extends StatefulWidget {
  final int selectedValue; // Receive the selected value from OnBordingScreen

  const LoginScreen({super.key, required this.selectedValue});

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
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SafeArea(
            child: Container(
              height: 645,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          child: Image(
                            image: AssetImage(AppImagesPath.createaccountimage),
                          ),
                        ),
                        const Image(
                          image: AssetImage(AppImagesPath.wlcomsignupimage),
                        ),
                        const SizedBox(height: 10),
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
                                  AppImagesPath.manimage,
                                ),
                              ),
                            ),
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 75,
                          width: 319,
                          child: IntlPhoneField(
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                                fillColor: AppColors.lightblack,
                                filled: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: '12345678',
                                hintStyle: const TextStyle(
                                  color: Colors.black12,
                                )),
                            initialCountryCode: 'US',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                            showDropdownIcon: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 50,
                          child: TextFieldDesign(
                            hintText: 'Address',
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                backgroundColor: AppColors.bluescolor,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                ),
                              ),
                            ),
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 10),
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
                                ),
                              ),
                            ),
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 55,
                          child: CustomButtonDesign(
                            buttonText: 'Create Profile',
                            onPressed: () {
                              if (widget.selectedValue == 0) {
                                // Navigate to Customer Side
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BottomNavBar(),
                                  ),
                                );
                              } else if (widget.selectedValue == 1) {
                                // Navigate to Business Side
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BusinessAppNavBar(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Already Have Account?",
                              style: TextStyle(
                                  color: AppColors.darkblue, fontSize: 14),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Login Now',
                                style: TextStyle(
                                    color: AppColors.bluescolor, fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                    alignment: Alignment(0.02, 0.6),
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                    child: Image(
                      image: AssetImage(
                        AppImagesPath.logintextimage,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: TextFieldDesign(
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
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
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
                      hintText: '*****',
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: CustomButtonDesign(
                          buttonText: 'Login',
                          onPressed: () {
                            if (widget.selectedValue == 0) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavBar(),
                                ),
                              );
                            } else if (widget.selectedValue == 1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BusinessAppNavBar(),
                                ),
                              );
                            }
                          }),
                    ),
                  ),
                  Align(
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
                          onPressed: () {
                            _showBottomSheet();
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
          ],
        ),
      ),
    );
  }
}
