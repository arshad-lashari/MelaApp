import 'dart:convert';
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

  Future<void> _fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(
          'https://mela-backend.vercel.app/customer/getServiceByCategory?category=Web'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        final categoriessData = categoriess.fromJson(data); // Renamed variable
        setState(() {
          _categories = categoriessData.categories ?? [];
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
 
 
  }
}
