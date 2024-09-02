import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/bottomnav.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/CustomerSide/screens/homescreen.dart';

class CustomBottomSheet extends StatelessWidget {
  final bool chekvalue;
  final Function(bool?) onCheckboxChanged;
  final Function onClose;
  final Function onCreateProfile;
  final Function onLoginNow;

  const CustomBottomSheet({
    Key? key,
    required this.chekvalue,
    required this.onCheckboxChanged,
    required this.onClose,
    required this.onCreateProfile,
    required this.onLoginNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClose();
      },
      child: SafeArea(
        child: Container(
          height: 645,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34), topRight: Radius.circular(34)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Padding(
                // Adjust the padding when keyboard appears
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
                            contentPadding: const EdgeInsets.symmetric(vertical: 3),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: '12345678',
                            // ignore: prefer_const_constructors
                            hintStyle: TextStyle(
                              color: Colors.black12,
                            )),
                        initialCountryCode: 'US', // Set initial country code
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 55,
                      child: CustomButtonDesign(
                        buttonText: 'Create Profile',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavBar(),
                              ));
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
                            onLoginNow();
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
  }
}
