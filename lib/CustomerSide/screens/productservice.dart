import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/CustomerSide/screens/customscreens/celandercustom.dart';
import 'package:mela/CustomerSide/screens/workcomplete.dart';
import 'package:mela/constant/productservicehomeviewcustom.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductServiceHomeImageDetailsCustom(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
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
                    child: MonthCalendar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 5, left: 10),
                    child: Text(
                      'Time',
                      style: TextStyle(
                        color: AppColors.darkblue,
                        fontFamily: 'Ubuntu',
                        fontSize: 16,
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
                        color: AppColors.darkblue,
                      ),
                    ),
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AppImagesPath.profile),
                      ),
                      SizedBox(width: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Andy Waruwu',
                            style: TextStyle(
                              color: AppColors.darkblue,
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
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
                      Spacer(),
                      Text('234 PM'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                // width: 85,
                height: 78,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(AppImagesPath.homeimage),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 2),
              child: Text(
                'Royal Cleaners are very competent in doing her job. '
                'We are the best worker who is very disciplined in '
                'any case. We will do the job according to '
                'what you want.',
                style: TextStyle(
                  color: AppColors.darkblue,
                  fontFamily: 'Ubuntu',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButtonDesign(
                buttonText: 'Schedule Now',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkCompleScreen(),
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
