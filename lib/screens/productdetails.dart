import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  AppColors appColors=AppColors();
  AppImagesPath appImagesPath=AppImagesPath();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
     body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 30  ),
       child: Column(
         children: [
           Row(
             children: [
               Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(5),
                   color: Colors.white,
                   
                 ),
                 child: Icon(Icons.arrow_back,color: Colors.black,),
               ),
               SizedBox(width: 90,),
                 Align(
                   alignment: Alignment.center,
                   child: Text('Cleaners',style: TextStyle(
                     fontSize: 20,fontWeight: FontWeight.w500,fontFamily: 'Ubuntu',
                     color: AppColors.darkblue
                   ),))
             ],
           ),
           SizedBox(height: 50,),
           SizedBox(
            width: 327,
            height: 48,

             child: TextField(
              decoration: InputDecoration(
                enabledBorder:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 0),
                  borderRadius: BorderRadius.circular(5)
                ),
                border: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.white,width: 0,
                )),
                fillColor: Colors.white,
                filled: true
              ),
             ),
           )

         ],
       ),
     ),
    );
  }
}