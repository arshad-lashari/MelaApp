import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mela/Models/productservicedetailsapi.dart';
import 'package:mela/Models/userdetailsapi.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/CustomerSide/screens/customscreens/celandercustom.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductServiceDetails extends StatefulWidget {
  final String productid;
  const ProductServiceDetails({
    super.key,
    required this.productid,
  });

  @override
  State<ProductServiceDetails> createState() => _ProductServiceDetailsState();
}

class _ProductServiceDetailsState extends State<ProductServiceDetails> {
  Future<ProductServiceDetailsApi>? getproductservicedetails;
  void initState() {
    super.initState();
    getuserdetailpro();

    getproductservicedetails = pruductsevicedetailss();
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
        print('here is user Id$jsonResponse');
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

  Future<void> bookservice(String serviceId, String userId, String date) async {
    try {
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/customer/book-service'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'serviceId': serviceId,
          'userId': userId,
          'date': date,
        }),
      );

      if (response.statusCode == 201) {
        // Success
        var responseBody = json.decode(response.body);
        print('Booking successful: $responseBody');
      } else {
        // Failure
        print('Failed to book service. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (error) {
      print('Error occurred while booking service: $error');
    }
  }

  DateTime? selectedDate;

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date; // Storing the selected date in the state
      print(
          'Selected Date: $selectedDate'); // Debugging: Ensure date is selected
    });
  }

  Future<ProductServiceDetailsApi> pruductsevicedetailss() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://mela-backend.vercel.app/customer/getServiceDetails?serviceId=${widget.productid}'),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Here Is Category details by product id $data');
        // Parse the JSON response into ProductServiceDetailsApi object
        return ProductServiceDetailsApi.fromJson(jsonDecode(response.body));
      } else {
        // Handle non-200 status code
        throw Exception('Failed to load service details');
      }
    } catch (e) {
      // Handle exceptions like network errors
      throw Exception('Error: $e');
    }
  }

  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightblue,
        body: FutureBuilder<ProductServiceDetailsApi>(
          future: getproductservicedetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Text("There is no data in snapshot");
            } else if (snapshot.hasData) {
              final service = snapshot.data?.service;
              List<dynamic>? reviews = snapshot.data!.reviews;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 243,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                // fit: BoxFit.cover,
                                image: NetworkImage(service?.pic ?? ''),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 25, horizontal: 25),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: AppColors.lightblue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // ignore: prefer_const_constructors
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Stack(children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        service?.serviceName ?? '',
                                        style: const TextStyle(
                                          color: AppColors.darkblue,
                                          fontFamily: 'Ubuntu',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          // Generate a list of star icons
                                          ...List.generate(
                                              5,
                                              (index) => const Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: Color(0xFFFFA873),
                                                  )),
                                          const SizedBox(width: 5),
                                          const Text(
                                            '5.0',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Ubuntu',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 27,
                                        width: 27,
                                        child:
                                            Image.asset(AppImagesPath.dollar),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '\$${service?.price?.toString() ?? ''}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Ubuntu',
                                            color: AppColors.darkblue),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 22,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        service?.location ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 27),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '25 Reviews',
                                    style: TextStyle(
                                      color: AppColors.darkblue,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '',
                            style: TextStyle(
                              color: AppColors.darkblue,
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 122,
                            width: double.infinity,
                            child: MonthCalendar(
                              onDateSelected: (date) {
                                print(
                                    'Date selected in MonthCalendar: $date'); // Debugging
                                onDateSelected(
                                    date); // Trigger the state change when the user selects a date
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5, left: 10),
                            child: Text(
                              'Time',
                              style: TextStyle(
                                color: AppColors.darkblue,
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          CustomTimeFormatDesign(
                            time: appText.time,
                            timeformat: appText.timefromat,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage(AppImagesPath.profile),
                              ),
                              const SizedBox(width: 7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Andy Waruwu',
                                    style: TextStyle(
                                      color: AppColors.darkblue,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      ...List.generate(
                                        5, // Number of stars
                                        (index) => const Icon(
                                          Icons.star,
                                          size: 14,
                                          color: Color(0xFFFFA873),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Text(
                                        '5.0',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              const Text('2:34 PM'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        // width: 85,
                        height: 78,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(AppImagesPath.homeimage),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                      child: Text(
                        'Royal Cleaners are very competent in doing her job. '
                        'We are the best worker who is very disciplined in '
                        'any case. We will do the job according to '
                        'what you want.',
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontFamily: 'Ubuntu',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButtonDesign(
                        buttonText: 'Schedule Now',
                        onPressed: () async {
                          // Check if the productId is available
                          if (widget.productid == null ||
                              widget.productid.isEmpty) {
                            print(
                                'Product ID is missing.'); // Handle missing product ID error
                            return; // Exit the function
                          }

                          // Check if the selected date is available
                          if (selectedDate == null) {
                            print(
                                'No date selected.'); // Handle case where no date is selected
                            return; // Exit the function
                          }

                          // Fetch the user ID
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? userId = prefs.getString('userID');

                          // Check if the user ID is available
                          if (userId == null || userId.isEmpty) {
                            print(
                                'User ID is missing.'); // Handle missing user ID error
                            return; // Exit the function
                          }

                          // Proceed with booking if all data is valid
                          try {
                            await bookservice(widget.productid, userId,
                                selectedDate.toString());
                            print('Booking successful');
                          } catch (error) {
                            print(
                                'Error occurred during booking: $error'); // Handle booking errors
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              );
            }
            return const Text('Failed to load data');
          },
        ));
  }
}

//everything about celender
