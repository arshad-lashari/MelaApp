import 'package:flutter/material.dart';
import 'package:mela/constant/imagespath.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      Column(
        children: [
          Container(
            height: 243,
            width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImagesPath.homeimage),
          )
          ),
          ),
        ],
      ),
      Positioned(
        top: 213,
        left: 20,
        child: Container(
        height: 48,
        width: 327,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
        ),
        child: const Row(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.green,
                filled: true
              ),
              
            )
          ],
        ),
      ))
            
          
        ],
      ),
    );
  }
}