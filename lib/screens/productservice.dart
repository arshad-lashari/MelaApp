import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/codetesting.dart';
import 'package:mela/screens/customdesign.dart';

class ProductServiceDetails extends StatefulWidget {
  const ProductServiceDetails({super.key});

  @override
  State<ProductServiceDetails> createState() => _ProductServiceDetailsState();
}

class _ProductServiceDetailsState extends State<ProductServiceDetails> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 360,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 243,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImagesPath.homeimage),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        left: 15,
                        right: 15,
                        child: Column(
                          children: [
                            Row(
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
                            SizedBox(height: 6),
                            Row(
                              children: [
                                SizedBox(
                                  height: 27,
                                  width: 27,
                                  child: Image.asset(AppImagesPath.dollar),
                                ),
                                SizedBox(width: 8),
                                Text('\$300'),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 22,
                                  color: Colors.red,
                                ),
                                Text(
                                  '18 Fish Street Hill',
                                  style: TextStyle(
                                    color: AppColors.darkblue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Royal Cleaners are very competent in doing her job. '
                        'We are the best worker who is very disciplined in '
                        'any case. We will do the job according to '
                        'what you want.. Read More',
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontFamily: 'Ubuntu',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Set your time',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Ubuntu',
                              color: AppColors.darkblue,
                            ),
                          ),
                          Text(
                            '< Monday >',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Ubuntu',
                              color: AppColors.darkblue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                SizedBox(
                  height: 254,
                  child: MonthCalendar()),
                      Text('Time', style: TextStyle(
                          color: AppColors.darkblue,
                          fontFamily: 'Ubuntu',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      CustomTimeFormatDesign(time: appText.time, timeformat: appText.timefromat,)
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 276,
            right: 40,
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
        ],
      ),
    );
  }
}
