import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/codetesting.dart';
import 'package:mela/screens/customdesign.dart';
import 'package:mela/screens/customscreens/celandercustom.dart';

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        decoration: const BoxDecoration(
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
                          mainAxisAlignment: MainAxisAlignment.start,
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
                                const Text('\$300'),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
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
                    
                      const SizedBox(
                          height: 122,
                          width: double.infinity,
                          child: MonthCalendar()),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 10),
                        child: const Text(
                          'Time',
                          style: TextStyle(
                            color: AppColors.darkblue,
                            fontFamily: 'Ubuntu',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      CustomTimeFormatDesign(
                        time: appText.time,
                        timeformat: appText.timefromat,
                      ),
                    
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          'Reviews',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkblue),
                        ),
                      ),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(AppImagesPath.profile),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Column(
                            children: [
                              Text(
                                'Andy Waruwu',
                                style: TextStyle(
                                    color: AppColors.darkblue,
                                    fontFamily: 'Ubuntu',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xFFFFA873),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xFFFFA873),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xFFFFA873),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Color(0xFFFFA873),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 14,
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
                          SizedBox(
                            width: 100,
                          ),
                          Text('234 PM')
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                      width: 85,
                      height: 78,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(AppImagesPath.homeimage))),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                  child: Text('Royal Cleaners are very competent in doing her job. '
                      'We are the best worker who is very disciplined in '
                      'any case. We will do the job according to '
                      'what you want.',style: TextStyle(
                        color: AppColors.darkblue,
                        fontFamily: 'Ubuntu',fontSize: 12,fontWeight: FontWeight.w400
                      ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                  child: CustomButtonDesign(buttonText: 'Shedule Now', onPressed: (){}),
                )
              ],
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
      ),
    );
  }
}
