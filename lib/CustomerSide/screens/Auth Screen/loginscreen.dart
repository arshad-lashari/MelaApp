import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mela/BusinessSide/B_Screens/b_navbarscreen.dart';

import 'package:mela/Services/utilties/appurls.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/bottomnav.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  final int selectedValue; // Receive the selected value from OnBordingScreen

  const LoginScreen({super.key, required this.selectedValue});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController signamecontroller = TextEditingController();
  TextEditingController signemailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController logemailcontroller = TextEditingController();
  TextEditingController logpasswordcontroller = TextEditingController();

  void bregister(String signame, String signemail, String phone, String address,
      String city, String zipcode, String password) async {
    Map<String, dynamic> body = {
      'name': signame,
      'email': signemail,
      'password': password,
      'phone': phone,
      'address': address,
      'city': city,
      'zipCode': zipcode,
    };

    try {
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/business/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        // Handle successful response
        // Updated status code for successful creation
        print('Register Successfully');
        if (data['userId'] != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("userID", data['userId']);
          print('User ID: ${pref.getString('userID')}');
        } else {
          print('User ID not found in the response.');
        }
        print('Selected Value: ${widget.selectedValue}');

        if (widget.selectedValue == 0) {
          // Navigate to Customer Side
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
          );
        } else if (widget.selectedValue == 1) {
          // Navigate to Business Side
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BusinessAppNavBar(),
            ),
          );
        } else {
          print('Invalid selectedValue: ${widget.selectedValue}');
        }
        print('Business registered successfully.');
      } else {
        print('Invalid selectedValue: ${widget.selectedValue}');

        print(
            'Failed to register business. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors
      print('Error occurred: $e');
    }
  }

  void Blogin(String logemail, String logpassword) async {
    Map<String, dynamic> body = {
      "email": logemail,
      "password": logpassword,
    };

    try {
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/business/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data['userId'] != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("userID", data['userId']);
          print('User ID: ${pref.getString('userID')}');
        } else {
          print('User ID not found in the response.');
        }

        if (widget.selectedValue == 0) {
          // Navigate to Customer side
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
          );
        } else if (widget.selectedValue == 1) {
          // Navigate to Business side
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessAppNavBar(),
            ),
          );
        }
      } else {
        // Handle other status codes or errors
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

void Register(String signame, String signemail, String phone, String address,
    String city, String zipcode, String password) async {
  Map<String, dynamic> body = {
    'name': signame,
    'email': signemail,
    'password': password,
    'phone': phone,
    'address': address,
    'city': city,
    'zipCode': zipcode,
  };

  try {
    final response = await http.post(
      Uri.parse(CustomSideApi.signupurl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    var data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      // Updated status code for successful creation
      print('Register Successfully');
      SharedPreferences pref = await SharedPreferences.getInstance();

      if (data['userId'] != null) {
        // Check if the user ID is already stored
        if (pref.getString("userID") == null) {
          pref.setString("userID", data['userId']);
          print('User ID stored: ${pref.getString('userID')}');
        } else {
          print('User ID already exists: ${pref.getString("userID")}');
        }
      } else {
        print('User ID not found in the response.');
      }

      print('Selected Value: ${widget.selectedValue}');

      if (widget.selectedValue == 0) {
        // Navigate to Customer Side
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BottomNavBar(),
          ),
        );
      } else if (widget.selectedValue == 1) {
        // Navigate to Business Side
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BusinessAppNavBar(),
          ),
        );
      } else {
        print('Invalid selectedValue: ${widget.selectedValue}');
      }
    } else {
      print('Error: ${response.statusCode}');
      print('Error Body: ${response.body}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

//function for login
  void login(String logemail, String logpassword) async {
    Map<String, dynamic> body = {
      "email": logemail,
      "password": logpassword,
    };

    try {
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/customer/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data['userId'] != null) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("userID", data['userId']);
          print('User ID: ${pref.getString('userID')}');
       
       
       
        } else {
          print('User ID not found in the response.');
        }

        if (widget.selectedValue == 0) {
          // Navigate to Customer side
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(),
            ),
          );
        } else if (widget.selectedValue == 1) {
          // Navigate to Business side
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessAppNavBar(),
            ),
          );
        }
      } else {
        // Handle other status codes or errors
        print('Error: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      // Handle exception
      print('Exception: $e');
    }
  }

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
                            controller: signamecontroller,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: CircleAvatar(
                                backgroundColor: AppColors.bluescolor,
                                child: Image.asset(
                                  AppImagesPath.manimage,
                                  height: 25,
                                  width: 25,
                                ),
                              ),
                            ),
                            obscureText: false,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 55,
                          child: TextFieldDesign(
                            controller: signemailcontroller,
                            hintText: 'DavidKowi@gmail.com',
                            prefixIcon: const Padding(
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
                          height: 55,
                          child: TextFieldDesign(
                            controller: passwordcontroller,
                            hintText: 'Password',
                            prefixIcon: const Padding(
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
                            controller: phonecontroller,
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
                        SizedBox(
                          height: 50,
                          child: TextFieldDesign(
                            controller: adresscontroller,
                            hintText: 'Address',
                            prefixIcon: const Padding(
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
                        SizedBox(
                          height: 55,
                          child: TextFieldDesign(
                            controller: citycontroller,
                            hintText: 'City',
                            prefixIcon: const Padding(
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
                        SizedBox(
                          height: 50,
                          child: TextFieldDesign(
                            controller: zipcodecontroller,
                            hintText: 'Zip_Code',
                            prefixIcon: const Padding(
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
                            onPressed: () async {
                              if (widget.selectedValue == 0) {
                                // Register as a customer
                                Register(
                                  signamecontroller.text,
                                  signemailcontroller.text,
                                  phonecontroller.text,
                                  adresscontroller.text,
                                  citycontroller.text,
                                  zipcodecontroller.text,
                                  passwordcontroller.text,
                                );
                              } else if (widget.selectedValue == 1) {
                                // Register as a business
                                bregister(
                                  signamecontroller.text,
                                  signemailcontroller.text,
                                  phonecontroller.text,
                                  adresscontroller.text,
                                  citycontroller.text,
                                  zipcodecontroller.text,
                                  passwordcontroller.text,
                                );
                              } else {
                                print(
                                    'Invalid selectedValue: ${widget.selectedValue}');
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
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldDesign(
                      controller: logemailcontroller,
                      // controller: loginemailcontroller,

                      prefixIcon: const Padding(
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
                  SizedBox(
                    width: double.infinity,
                    child: TextFieldDesign(
                      controller: logpasswordcontroller,
                      prefixIcon: const Padding(
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
                            {
                              if (widget.selectedValue == 0) {
                                // Register as a customer
                                login(logemailcontroller.text.toString(),
                                    logpasswordcontroller.text.toString());
                              } else if (widget.selectedValue == 1) {
                                // Register as a business
                                Blogin(logemailcontroller.text.toString(),
                                    logpasswordcontroller.text.toString());
                              } else {
                                print(
                                    'Invalid selectedValue: ${widget.selectedValue}');
                              }
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
