import 'dart:convert';
import 'package:flutter/material.dart';
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
  Future<List<Categoryapis>>? categoryFuture; // List of Categoryapis
  List<String> allcategory = [
    "IT",
    "Cleaners",
    "Movers",
    "Repairing",
    "Plumbers, Mechanic, Glass Work",
    "Furniture"
  ];

  @override
  void initState() {
    super.initState();
    categoryFuture = fetchAllCategoriesData(); // Initialize categoryFuture
  }

  Future<Categoryapis> fetchCategoryData(String category) async {
    final response = await http.get(Uri.parse(
        'https://mela-backend.vercel.app/customer/getServiceByCategory?category=$category'));

    if (response.statusCode == 200) {
      return Categoryapis.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category data');
    }
  }

  Future<List<Categoryapis>> fetchAllCategoriesData() async {
    List<Categoryapis> allCategoryData = [];

    for (String category in allcategory) {
      try {
        Categoryapis data = await fetchCategoryData(category);
        allCategoryData.add(data);
      } catch (e) {
        print("Failed to load data for category $category: $e");
      }
    }

    return allCategoryData;
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
                              child: FutureBuilder<List<Categoryapis>>(
                                future: categoryFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (!snapshot.hasData) {
                                    return const Center(
                                      child: Text('Failed to load data'),
                                    );
                                  } else if (snapshot.hasData) {
                                    return GridView.builder(
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 30,
                                      ),
                                      itemBuilder: (context, index) {
                                        var categoryData =
                                            snapshot.data![index];
                                        return GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              categoryData.services?.length ??
                                                  0,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            childAspectRatio: 1,
                                          ),
                                          itemBuilder: (context, serviceIndex) {
                                            var service = categoryData
                                                .services![serviceIndex];
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                        ProductDetailsScreen(
                                                          categoryimagepath: service.pic??'', 
                                                        categoryimagetext: service.category??'', 
                                                        categoryprice:service.price?.toString()?? '', 
                                                        services: categoryData.services ?? [],   
                                                          
                                                        )
                                                    ));
                                              },
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    service.pic ?? '',
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Text(
                                                    service.category ?? '',
                                                    style: const TextStyle(
                                                        fontFamily: 'Ubuntu',
                                                        fontSize: 10,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  } else {
                                    return const Center(
                                      child: Text('No data available'),
                                    );
                                  }
                                },
                              ))),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Container(
                color: Colors.transparent,
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 20,
                      child: SizedBox(
                        height: 55,
                        width: 200,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Find the best services for you',
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
                    Positioned(
                      top: 40,
                      right: 20,
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: Align(
                          alignment: Alignment.centerRight,
                          // child: Image.asset(AppImagesPath.searchicon),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
