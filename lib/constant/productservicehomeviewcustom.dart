import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class ProductServiceHomeImageDetailsCustom extends StatefulWidget {
  const ProductServiceHomeImageDetailsCustom({super.key});

  @override
  State<ProductServiceHomeImageDetailsCustom> createState() =>
      _ProductServiceHomeImageDetailsCustomState();
}

class _ProductServiceHomeImageDetailsCustomState
    extends State<ProductServiceHomeImageDetailsCustom> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppColors appColors = AppColors();
  AppText appText = AppText();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 243,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImagesPath.homeimage),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.RoyalCleaners10,
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFA873),
                          ),
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFA873),
                          ),
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFA873),
                          ),
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFA873),
                          ),
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Color(0xFFFFA873),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '5.0',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      SizedBox(
                        height: 27,
                        width: 27,
                        child: Image.asset(AppImagesPath.dollar),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$300',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            color: AppColors.darkblue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 22,
                        color: Colors.red,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '18 Fish Street Hill',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 27),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '25 Reviews',
                    style: TextStyle(
                      color: AppColors.darkblue,
                      fontFamily: 'Ubuntu',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
