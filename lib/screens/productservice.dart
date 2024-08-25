import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class ProductServiceDetails extends StatefulWidget {
  const ProductServiceDetails({super.key});

  @override
  State<ProductServiceDetails> createState() => _ProductServiceDetailsState();
}

class _ProductServiceDetailsState extends State<ProductServiceDetails> {
  AppImagesPath appImagesPath=AppImagesPath();
  AppText appText=AppText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 360,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red ,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
                    child: Stack(
                      children: [
                        Container(
                          height: 243,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(AppImagesPath.homeimage))
                          ),
                        ),
                        Positioned(bottom: 80,left: 5,
                          child: const Column(
                            children: [
                              Row(
                                children: [
                                  Text(AppText.RoyalCleaners10,style: TextStyle(
                                    color: AppColors.darkblue,fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.w500
                                  ),),
                                  Icon(Icons.star)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
          )
        ],
      ),
    );
  }
}
