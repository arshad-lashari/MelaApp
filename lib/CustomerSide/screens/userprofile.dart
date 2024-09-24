import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
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
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipCodecontroller = TextEditingController();

  bool isSwitched = false;
  File? image;
  String? downloadUrl;

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
          zipCodecontroller.text = userDetails.user!.zipCode ?? '';
          citycontroller.text = userDetails.user!.city ?? '';
          downloadUrl = userDetails.user!.pic; // Load the image URL
        }
      });
    } catch (e) {
      print('Error loading user details: $e');
    }
  }

  Future<void> editProfile(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var userId = sharedPreferences.getString('userID');

    Map<String, dynamic> requestBody = {
      'name': namecontroller.text,
      'location': citycontroller.text,
      'userId': userId,
      'address': adresscontroller.text,
      'city': citycontroller.text,
      'zipCode': zipCodecontroller.text,
      'pic': downloadUrl, // Include the download URL
    };

    try {
      final response = await http.put(
        Uri.parse('https://mela-backend.vercel.app/customer/edit-profile'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: ${response.statusCode}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
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
        final jsonResponse = json.decode(response.body);
        return UserDetailsapi.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load user details');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);

      setState(() {
        image = file;
      });

      try {
        // Upload the image to Firebase Storage
        String fileName =
            'profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        FirebaseStorage storage = FirebaseStorage.instance;
        TaskSnapshot snapshot =
            await storage.ref().child(fileName).putFile(file);

        // Get the download URL of the uploaded file
        downloadUrl = await snapshot.ref.getDownloadURL();
        print('Image uploaded! Download URL: $downloadUrl');
      } catch (e) {
        print('Error uploading image: $e');
      }
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
                  // trackOutlineColor: Colors.transparent,
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
                  topRight: Radius.circular(24),
                ),
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
                            onTap: _pickImage,
                            child: Stack(
                              children: [
                                Container(
                                  height: 97,
                                  width: 97,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightblue,
                                    borderRadius: BorderRadius.circular(76),
                                  ),
                                  child: image != null || downloadUrl != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(76),
                                          child: image != null
                                              ? Image.file(
                                                  image!,
                                                  height: 97,
                                                  width: 97,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.network(
                                                  downloadUrl!,
                                                  height: 97,
                                                  width: 97,
                                                  fit: BoxFit.cover,
                                                ),
                                        )
                                      : const Center(
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                ),
                                Positioned(
                                  bottom: 2,
                                  right: 3,
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
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Text('Name',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: namecontroller,
                            hintText: 'Name',
                            obscureText: false),
                      ),
                      const SizedBox(height: 10),
                      const Text('Email',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: emailcontroller,
                            hintText: 'Email',
                            obscureText: false),
                      ),
                      const SizedBox(height: 10),
                      const Text('Contact No',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: contactcontroller,
                            hintText: 'Contact',
                            obscureText: false),
                      ),
                      const SizedBox(height: 10),
                      const Text('Address',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: adresscontroller,
                            hintText: 'Address',
                            obscureText: false),
                      ),
                      const SizedBox(height: 10),
                      const Text('City',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: citycontroller,
                            hintText: 'City',
                            obscureText: false),
                      ),
                      const SizedBox(height: 10),
                      const Text('Zip Code',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: TextFieldDesign(
                            controller: zipCodecontroller,
                            hintText: 'Zip Code',
                            obscureText: false),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            editProfile(context);
                          },
                          child: const Text('Update Profile'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluescolor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
