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

  Future<void> bookservice(
      String serviceId, String userId, String date, String businessId) async {
    try {
      print('Attempting to book service with the following details:');
      print('Service ID: $serviceId');
      print('User ID: $userId');
      print('Booking Date: $date');
      print('Business ID: $businessId');

      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/customer/book-service'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'serviceId': serviceId,
          'userId': userId,
          'bookingDate': date,
          'businessId': businessId,
        }),
      );

      if (response.statusCode == 201) {
        var responseBody = json.decode(response.body);
        print('Booking successful: $responseBody');
      } else {
        print('Failed to book service. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
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
              double averageRating = 0.0;

              // Calculate average rating if reviews are not null
              if (reviews != null && reviews.isNotEmpty) {
                double totalRating = 0.0;
                for (var review in reviews) {
                  // Assuming review has a 'rating' field
                  totalRating += review['rating'] ??
                      0.0; // Adjust based on your review structure
                }
                averageRating = totalRating / reviews.length;
              }
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
                                fit: BoxFit.cover,
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
                                        maxLines: 2, // Limit to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Show '...' if text overflows
                                        softWrap:
                                            true, // Wrap text if it exceeds available space
                                        style: const TextStyle(
                                          fontSize:
                                              16.0, // Adjust font size as needed
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          // Display the calculated average rating
                                          ...List.generate(
                                              5,
                                              (index) => Icon(
                                                    Icons.star,
                                                    size: 18,
                                                    color: index <
                                                            averageRating
                                                                .round()
                                                        ? const Color(
                                                            0xFFFFA873)
                                                        : Colors
                                                            .grey, // Change color based on rating
                                                  )),
                                          const SizedBox(width: 5),
                                          Text(
                                            averageRating.toStringAsFixed(1),
                                            style: const TextStyle(
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
                                  onDateSelected: (DateTime selectedDate) {
                                // Handle the selected date here
                                print(
                                    'Date selected: ${selectedDate.toLocal()}');
                                // You can also show a dialog or navigate to another screen based on the selected date
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Selected Date: ${selectedDate.toLocal()}'),
                                  ),
                                );
                              })),
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
                          if (widget.productid.isEmpty ||
                              selectedDate == null) {
                            print('Product ID or date is missing.');
                            return;
                          }

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          String? userId = prefs.getString('userID');
                          String? businessId = service
                              ?.business; // Get the business ID from the service object

                          if (userId == null ||
                              userId.isEmpty ||
                              businessId == null ||
                              businessId.isEmpty) {
                            print('User ID or Business ID is missing.');
                            return;
                          }

                          try {
                            await bookservice(widget.productid, userId,
                                selectedDate!.toIso8601String(), businessId);
                            print('Service booked successfully!');
                          } catch (e) {
                            print('Failed to book the service: $e');
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
