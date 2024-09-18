import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mela/Models/userdetailsapi.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/CustomerSide/screens/customscreens/celandercustom.dart';
import 'package:mela/CustomerSide/screens/workcomplete.dart';
import 'package:http/http.dart' as http;

class ProductServiceDetails extends StatefulWidget {
  final String productId;
  final String productdiscription;
  final String productname;
  final String productprice;
  final String producimage;
  final String productcategory;
  final String userId='66e9a6fc4580c317d195263b';

  const ProductServiceDetails({
    super.key,
    required this.productId,
    required this.productdiscription,
    required this.productname,
    required this.productprice,
    required this.producimage,
    required this.productcategory, 
  });

  @override
  State<ProductServiceDetails> createState() => _ProductServiceDetailsState();
}

class _ProductServiceDetailsState extends State<ProductServiceDetails> {

  //get userdetails also



Future<Map<String, dynamic>?> fetchUserInfo(String userId) async {
  if (userId.isEmpty) {
    print('Error: userId is empty');
    return null;
  }

  final String url = 'https://mela-backend.vercel.app/customer/getUser?userId=$userId';
  print('Request URL: $url'); // Log the URL for debugging

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      print('Failed to load user info: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Exception occurred: $e');
    return null;
  }
}

  Future<void> BookService(String userId, String serviceId, DateTime bookingDate) async {
  try {
    final response = await http.post(
      Uri.parse('https://mela-backend.vercel.app/customer/book-service'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user': userId,
        'service': serviceId,
        'bookingDate': bookingDate.toIso8601String(), // Convert DateTime to ISO string
        'status': 'Pending', // Assuming the default status is 'Pending'
      }),
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the response.
      print('Service booked successfully');
      var responseData = jsonDecode(response.body);
      // Process responseData here if needed
    } else {
      throw Exception('Failed to book service. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
    // Handle the error accordingly
  }
}



  Future<void> _handleBooking() async {
    if (selectedDate == null) {
      // Notify the user to select a date
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a date.')),
      );
      return;
    }

    try {
      await BookService(widget.userId, widget.productId, selectedDate!);
     
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WorkCompleScreen()),
      );
    } catch (e) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to book service.')),
      );
    }
  }
  // Future<Categoryapis> getservicedetails(String serviceId) async {
  //   try {
  //     final response = await http.get(Uri.parse(
  //         'https://mela-backend.vercel.app/customer/getServiceDetails?serviceId=$serviceId'));
  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> data = json.decode(response.body);
  //       print(data);
  //       return Categoryapis.fromJson(data);
  //     } else {
  //       throw Exception('Failed to load service details');
  //     }
  //   } catch (e) {
  //     print('Exception caught: $e');
  //     throw e;
  //   }
  // }

  DateTime? selectedDate; // To hold the selected date
  void initState() {
    super.initState();
    // getservicedetails(widget.productId);
     print("Product ID: ${widget.productId}");
    print("User ID: ${widget.userId}");
fetchUserInfo(widget.userId);
    print("Product ID: ${widget.productId}");
  }

  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: SingleChildScrollView(
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
                        image: NetworkImage(widget.producimage),
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
                                  borderRadius: BorderRadius.circular(10)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.productcategory,
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
                                child: Image.asset(AppImagesPath.dollar),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                widget.productprice,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Ubuntu',
                                    color: AppColors.darkblue),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 22,
                                color: Colors.red,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '18 Fish Street Hill',
                                style: TextStyle(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 27),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productdiscription,
                    style: const TextStyle(
                      color: AppColors.darkblue,
                      fontFamily: 'Ubuntu',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 122,
                    width: double.infinity,
                    child: MonthCalendar(),
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
                        backgroundImage: AssetImage(AppImagesPath.profile),
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
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
                onPressed: _handleBooking,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

//everything about celender
