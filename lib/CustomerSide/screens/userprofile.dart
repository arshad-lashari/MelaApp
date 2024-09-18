import 'dart:async';
import 'dart:convert';
import 'dart:io'; // For the File class
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela/Models/userdetailsapi.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    try {
      final userDetails = await getuserdetailpro();
      setState(() {
        if (userDetails.user != null) {
          namecontroller.text = userDetails.user!.name ?? '';
          emailcontroller.text = userDetails.user!.email ?? '';
          contactcontroller.text = userDetails.user!.phone ?? '';
          adresscontroller.text = userDetails.user!.address ?? '';
        }
      });
    } catch (e) {
      // Handle error
      print('Error loading user details: $e');
    }
  }

  Future<UserDetailsapi> getuserdetailpro() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var getid = sharedPreferences.getString('userID');
    String apiUrl =
        'https://mela-backend.vercel.app/customer/getUser?userId=$getid';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // If the server returns an OK response, parse the JSON
        final jsonResponse = json.decode(response.body);
        return UserDetailsapi.fromJson(jsonResponse);
      } else {
        // If the server does not return an OK response, throw an exception
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      throw Exception('An error occurred: $e');
    }
  }

  void _showImagePickerOptions() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  if (pickedFile != null) {
                    _imageFile = pickedFile;
                    // Optionally upload image here
                    //_uploadImage(File(_imageFile!.path));
                  }
                });
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text('Camera'),
            ),
            TextButton(
              onPressed: () async {
                final pickedFile =
                    await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  if (pickedFile != null) {
                    _imageFile = pickedFile;
                    // Optionally upload image here
                    //_uploadImage(File(_imageFile!.path));
                  }
                });
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text('Gallery'),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 10),
      ),
    );
  }

  Future<void> _uploadImage(File imageFile) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('your_image_upload_endpoint'),
    );
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));
    final response = await request.send();

    if (response.statusCode == 200) {
      // Handle success
      print('Image uploaded successfully');
    } else {
      // Handle failure
      print('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Customer Profile',
                  style: TextStyle(
                    color: AppColors.darkblue,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  activeColor: Colors.black12,
                  inactiveThumbColor: Colors.white,
                  trackOutlineColor: WidgetStateColor.transparent,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24)),
              ),
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
                          child: GestureDetector(
                            onTap: _showImagePickerOptions,
                            child: Container(
                              height: 97,
                              width: 97,
                              decoration: BoxDecoration(
                                color: AppColors.lightblue,
                                borderRadius: BorderRadius.circular(76),
                                image: _imageFile != null
                                    ? DecorationImage(
                                        image:
                                            FileImage(File(_imageFile!.path)),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: _imageFile == null
                                  ? Stack(
                                      children: [
                                        Positioned(
                                          bottom: 2,
                                          right: 3,
                                          child: Container(
                                            height: 26,
                                            width: 26,
                                            decoration: BoxDecoration(
                                              color: AppColors.bluescolor,
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                          controller: namecontroller,
                          hintText: 'Name',
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                          controller: emailcontroller,
                          hintText: 'Email',
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Contact No',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                          controller: contactcontroller,
                          hintText: 'Contact',
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Location',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                          controller: adresscontroller,
                          hintText: 'Address',
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButtonDesign(
                          buttonText: 'Save',
                          onPressed: () {
                            // Implement save functionality here
                          },
                        ),
                      ),
                      const SizedBox(height: 25),
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
