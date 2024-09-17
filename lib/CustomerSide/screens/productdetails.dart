import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mela/CustomerSide/screens/productservice.dart';
import 'package:mela/Models/customersidesignupmodel.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String categoryimagepath;
  final String categoryimagetext;
  final String categoryprice;
  final List<Services> services; // Added to pass the services list

  const ProductDetailsScreen({
    super.key,
    required this.categoryimagepath,
    required this.categoryimagetext,
    required this.categoryprice,
    required this.services,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
                      widget.categoryimagetext,
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 220,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: widget
                    .services.length, // Corrected to use the services length

                itemBuilder: (context, index) {
                  final service =
                      widget.services[index]; // Get the service object
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductServiceDetails(
                            productId: service.sId ?? '',
                            productname: service.category ?? '',
                            productdiscription: service.description ?? '',
                            producimage: service.pic ?? '',
                            productcategory: service.category ?? '',
                            productprice: service.price?.toString() ?? '',
                          ),
                        ),
                      );
                    },
                    child: Container(
                    
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
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
                                image: NetworkImage(widget.categoryimagepath),
                                onError: (error, stackTrace) {
                                  print('Failed to load image: $error');
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  // child: Text(
                                  //   appText.categoriestext[index],
                                  //   style: const TextStyle(
                                  //     fontFamily: 'Ubuntu',
                                  //     fontSize: 14,
                                  //     fontWeight: FontWeight.w500,
                                  //     color: AppColors.darkblue,
                                  //   ),
                                  // ),
                                ),
                                const SizedBox(height: 3),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    widget.categoryimagetext,
                                    style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.darkblue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 20,
                                      color: Color(0xFFFFA873),
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      '5.0',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.darkblue,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      '\$${widget.categoryprice}',
                                      style: TextStyle(
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
            ),
          ],
        ),
      ),
    );
  }
}
