import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/jobdetailsscreen.dart';

import 'package:mela/CustomSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class OrderDeailCustom extends StatefulWidget {
  final Widget? trailing;

  const OrderDeailCustom({super.key, this.trailing});

  @override
  State<OrderDeailCustom> createState() => _OrderDeailCustomState();
}

class _OrderDeailCustomState extends State<OrderDeailCustom> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppColors appColors = AppColors();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: appText.usernamesss.length,
        itemBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.2, 0.2),
                        spreadRadius: 1,
                        blurRadius: 10)
                  ],
         
         
         
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            appText.usernamesss[index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w500),
                          ),

                          // Display the trailing widget if provided
                          if (widget.trailing != null) widget.trailing!,
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            appText.dates[index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w400),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text('|'),
                          ),
                          Text(
                            appText.timess[index],
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Deep Cleans',
                        style: TextStyle(
                            color: AppColors.bluescolor,
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
                        'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                        'Ut enim ad minim veniam.',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: CustomButtonDesign(
                              buttonText: 'View Details',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobDetails(),
                                    ));
                              }))
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
