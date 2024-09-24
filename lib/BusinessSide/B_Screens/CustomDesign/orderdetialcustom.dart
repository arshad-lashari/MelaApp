import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/jobdetailsscreen.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/Models/getbookedservicesbyuserid.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDeailCustom extends StatefulWidget {
  final Widget? trailing;

  const OrderDeailCustom({super.key, this.trailing});

  @override
  State<OrderDeailCustom> createState() => _OrderDeailCustomState();
}

class _OrderDeailCustomState extends State<OrderDeailCustom> {
  @override
  void initState() {
    super.initState();
    getBookedServicesUserId();
  }

  Future<GetBookedServices> getBookedServicesUserId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var getid = sharedPreferences.getString('userID');

    if (getid == null) {
      throw Exception('User ID not found in SharedPreferences');
    }

    final response = await http.get(Uri.parse(
        'https://mela-backend.vercel.app/customer/getUserBookedServices?userId=$getid'));

    if (response.statusCode == 200) {
      // Parse the JSON response as a Map
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      print('Successfully fetched booked services');

      // Return the GetBookedServices object
      return GetBookedServices.fromJson(data);
    } else {
      // Log the failure reason and status code for further debugging
      print('Failed to load booked services: ${response.statusCode}');
      throw Exception('Failed to load booked services');
    }
  }

  AppImagesPath appImagesPath = AppImagesPath();
  AppColors appColors = AppColors();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<GetBookedServices>(
        future: getBookedServicesUserId(),
        builder: (context, snapshot) {
          // Handling the state of the Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While loading the data
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // In case of an error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // When data is available
            final bookings = snapshot.data?.bookings ?? [];
            if (bookings.isEmpty) {
              return const Center(
                child: Text('No booked services found.'),
              );
            }

            // Displaying the booked services
            return ListView.builder(
              itemCount: bookings.length, // Use the length of bookings list

              itemBuilder: (context, index) {
                final booking = bookings[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.2, 0.2),
                          spreadRadius: 1,
                          blurRadius: 10,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                booking.business?.name ?? 'No description',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // Display the trailing widget if provided
                              if (widget.trailing != null) widget.trailing!,
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                booking.bookingDate ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: Text('|'),
                              ),
                              Text(
                                appText.timess[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            booking.service?.category?.name ?? '',
                            style: const TextStyle(
                              color: AppColors.bluescolor,
                              fontSize: 14,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            booking.service?.description ?? '',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButtonDesign(
                              buttonText: 'View Details',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const JobDetails(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          // If no data is present
          return const Center(
            child: Text('No data found.'),
          );
        },
      ),
    );
  }
}
