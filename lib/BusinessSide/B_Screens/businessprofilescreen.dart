import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela/BusinessSide/B_Screens/subscriptionscreen.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
   TextEditingController namecontroller=TextEditingController();
    TextEditingController emailcontroller=TextEditingController();

  TextEditingController contactcontroller=TextEditingController();

  TextEditingController adresscontroller=TextEditingController();
  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();
  bool isSwitched = false;

  File? _selectedImage; // Variable to store the selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  void _showSnackBar() {
    final snackBar = SnackBar(
      backgroundColor: Colors.white,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () async {
              final pickedFile = await _picker.pickImage(
                  source: ImageSource.gallery); // Pick from gallery
              if (pickedFile != null) {
                setState(() {
                  _selectedImage = File(pickedFile.path);
                });
              }
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(); // Hide snackbar
            },
            child: const Text("Gallery", style: TextStyle(color: Colors.black)),
          ),
          TextButton(
            onPressed: () async {
              final pickedFile = await _picker.pickImage(
                  source: ImageSource.camera); // Pick from camera
              if (pickedFile != null) {
                setState(() {
                  _selectedImage = File(pickedFile.path);
                });
              }
              ScaffoldMessenger.of(context)
                  .hideCurrentSnackBar(); // Hide snackbar
            },
            child: const Text("Camera", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        backgroundColor: AppColors.lightblue,
        centerTitle: true,
        title: const Text(
          'Business Profile',
          style: TextStyle(
            color: AppColors.darkblue,
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
            activeColor: Colors.black12,
            inactiveThumbColor: Colors.white,
            trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ],
      ),
      body: Column(
        children: [
          // Use Expanded to make the container take up the remaining space
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Stack(
                            children: [
                              Container(
                                height: 97,
                                width: 97,
                                decoration: BoxDecoration(
                                  color: AppColors.lightblue,
                                  borderRadius: BorderRadius.circular(76),
                                ),
                                child: _selectedImage != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(76),
                                        child: Image.file(
                                          _selectedImage!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              Positioned(
                                bottom: 2,
                                right: 3,
                                child: GestureDetector(
                                  onTap: _showSnackBar,
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                      color: AppColors.bluescolor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 3,
                                      ),
                                    ),
                                    child: const Center(
                                        child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.white,
                                      size: 11,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 32,
                          width: 75,
                          child: CustomButtonDesign(
                            buttonText: 'Pro',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SubscriptionScreen(),
                                  ));
                            },
                          ),
                        ),
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                       SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextFieldDesign(
                            controller: namecontroller,
                            hintText: 'Name',
                            obscureText: false,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Email',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                       SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextFieldDesign(
                            controller: emailcontroller,
                            hintText: 'Email',
                            obscureText: false,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Phone',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                       SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextFieldDesign(
                            controller: contactcontroller,
                            hintText: 'Phone',
                            obscureText: false,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Address',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                       SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextFieldDesign(
                            controller: adresscontroller,
                            hintText: 'Address',
                            obscureText: false,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CustomButtonDesign(
                              buttonText: 'Save', onPressed: () {})),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
