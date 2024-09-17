import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mela/Models/customersidesignupmodel.dart';

class CategoryDisplay extends StatefulWidget {
  const CategoryDisplay({super.key});

  @override
  State<CategoryDisplay> createState() => _CategoryDisplayState();
}

class _CategoryDisplayState extends State<CategoryDisplay> {
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
    categoryFuture = fetchAllCategoriesData(); // Fetch data on init
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
      ),
      body: FutureBuilder<List<Categoryapis>>(
        future: categoryFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final allCategoryData = snapshot.data!;
            return ListView.builder(
              itemCount: allCategoryData.length,
              itemBuilder: (context, index) {
                final categoryapis = allCategoryData[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        allcategory[index],
                        // style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ...?categoryapis.services?.map((service) {
                      return ListTile(
                        leading: service.pic != null
                            ? Image.network(service.pic!)
                            : const Icon(Icons.image_not_supported),
                        title: Text(service.category ?? 'No Category Name'),
                      );
                    }).toList() ?? [const Text('No services available')],
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
