import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  Future<void> BookService(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/customer/book-service'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the response.
        print('Service booked successfully');
        // Handle the response data if needed.
        var responseData = jsonDecode(response.body);
        // Process responseData here
      } else {
        // If the server did not return a 200 OK response, throw an exception.
        throw Exception(
            'Failed to book service. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      // Handle the error accordingly
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

  void initState() {
    super.initState();
    // getservicedetails(widget.productId);

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
                                      (index) => Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Color(0xFFFFA873),
                                          )),
                                  SizedBox(width: 5),
                                  Text(
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
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AppImagesPath.profile),
                      ),
                      SizedBox(width: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
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
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Color(0xFFFFA873),
                              ),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Color(0xFFFFA873),
                              ),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Color(0xFFFFA873),
                              ),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Color(0xFFFFA873),
                              ),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Color(0xFFFFA873),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '5.0',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Text('2:34 PM'),
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkCompleScreen(),
                      ));
                },
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
