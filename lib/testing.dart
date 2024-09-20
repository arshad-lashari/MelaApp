import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mela/Models/categoriesdata.dart'; // Adjust import as necessary
import 'package:mela/Models/categorieservice.dart'; // Adjust import as necessary

class ApiTesting extends StatefulWidget {
  const ApiTesting({super.key});

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  List<Categories> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

 Future<categoriessmore> _fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(
          'https://mela-backend.vercel.app/customer/getServiceByCategory?category=web three'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        return categoriessmore.fromJson(data);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      log('Error: $e' as num);
      throw Exception('Error loading data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
 
 
  }
}
