import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mela/Models/categoriesdata.dart';
import 'package:mela/Models/customersidesignupmodel.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:http/http.dart' as http;
import 'package:mela/CustomerSide/screens/productdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getCategories();
    categoryFuture = getCategories(); // Initialize the future
  }

  Future<categoriess>? categoryFuture;
  Future<categoriess> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('https://mela-backend.vercel.app/customer/getCategories'),
      );

      if (response.statusCode == 200) {
        // If the server returns a successful response, parse the JSON data
        final jsonData = json.decode(response.body);
        print(jsonData);
        return categoriess.fromJson(
            jsonData); // Assuming fromJson is a method in the 'categoriess' class
      } else {
        // Handle any other status code, like 404, 500, etc.
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      throw e; // Re-throw the error for further handling if necessary
    }
  }

  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 243,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImagesPath.homeimage),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.lightblue1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex:
                                      3, // Control the space allocated to the text column
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Free Shipping',
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: CircleAvatar(
                                                radius: 2,
                                                backgroundColor: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Flexible(
                                              child: Text(
                                                'For purchases over 50\$',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: CircleAvatar(
                                                radius: 2,
                                                backgroundColor: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Flexible(
                                              child: Text(
                                                'Including all regions',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: CircleAvatar(
                                                radius: 2,
                                                backgroundColor: Colors.black,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Flexible(
                                              child: Text(
                                                'Deadline until October 13',
                                                style: TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              height: 21,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 45,
                                                    height: 21,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.bluescolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: const Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        'Bay',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 14,
                                                    color: Colors.black54,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:
                                      2, // Control the space allocated to the image
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SizedBox(
                                      height: 140,
                                      width: 140,
                                      child:
                                          Image.asset(AppImagesPath.delvryman),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       // ignore: prefer_const_constructors
                            //       builder: (context) => ProductDetailsScreen(
                            //         categoryimagepath: '',
                            //         categoryimagetext: '',
                            //       ),
                            //     ));
                          },
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  270, // Adjust height as needed
                              child: FutureBuilder<categoriess>(
                                future: categoryFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (!snapshot.hasData ||
                                      snapshot.data!.categories!.isEmpty) {
                                    return const Center(
                                      child: Text('No categories available'),
                                    );
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text('Failed to load data'),
                                    );
                                  } else {
                                    return GridView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          snapshot.data!.categories!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            4, // Adjust based on your desired layout
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 30,
                                      ),
                                      itemBuilder: (context, index) {
                                        var category =
                                            snapshot.data!.categories![index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailsScreen(
                                                  categoryName: category.name ??
                                                      'Unknown Category',
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Image.network(
                                                category.picture ?? '',
                                                height: 40,
                                                fit: BoxFit.fill,
                                              ),
                                              Text(
                                                category.name ?? '',
                                                style: const TextStyle(
                                                  fontFamily: 'Ubuntu',
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              )))
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 40,
              left: 20,
              child: SizedBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Find the best \n services for you',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
