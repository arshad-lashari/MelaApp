import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mela/CustomerSide/screens/productservice.dart';
import 'package:mela/Models/categoriesdata.dart';
import 'package:mela/Models/categorieservice.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String categoryName;
  const ProductDetailsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Future<categoriessmore>? getCategoriesFuture;

  Future<categoriessmore> _fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(
          'https://mela-backend.vercel.app/customer/getServiceByCategory?category=${widget.categoryName}'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        return categoriessmore.fromJson(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Error loading data');
    }
  }

  @override
  void initState() {
    super.initState();
    getCategoriesFuture = _fetchCategories();
  }

  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.categoryName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Ubuntu',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for cleaners, movers, repair, computer',
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 0),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<categoriessmore>(
              future: getCategoriesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Text('There is an error loading the data');
                } else if (snapshot.hasData &&
                    snapshot.data!.services!.isNotEmpty) {
                  final services = snapshot.data!.services!;
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 220,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        final serviceId = service.sId ?? 'default-id'; // Handle null sId
                        final servicePic = service.pic ?? ''; // Handle null pic
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductServiceDetails(
                                    productid: serviceId,
                                  ),
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: 118,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(servicePic),
                                        onError: (error, stackTrace) {
                                          log('Failed to load image: $error');
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service.serviceName ?? '',
                                        style: const TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.darkblue,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        (service.speciality ?? []).join(', '),
                                        style: const TextStyle(
                                          fontFamily: 'Ubuntu',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.darkblue,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Color(0xFFFFA873),
                                          ),
                                          const SizedBox(width: 2),
                                          const Text(
                                            '5.0',
                                            style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.darkblue,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '\$${service.price?.toString() ?? ''}',
                                            style: const TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.darkblue,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Text('No services available.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
