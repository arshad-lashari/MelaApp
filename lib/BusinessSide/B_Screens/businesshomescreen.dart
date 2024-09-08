import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/orderdetialcustom.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class BusinessAppHomeScreen extends StatefulWidget {
  final Widget? trailing;
  const BusinessAppHomeScreen({super.key, this.trailing});

  @override
  State<BusinessAppHomeScreen> createState() => _BusinessAppHomeScreenState();
}

class _BusinessAppHomeScreenState extends State<BusinessAppHomeScreen> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppColors appColors = AppColors();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppImagesPath.profile),
                    const Icon(Icons.notifications_outlined),
                  ],
                ),
              ),
              const Text(
                'Hello Franky',
                style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 14,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Text(
                'Your Upcoming Jobs',
                style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Define a fixed height for the ListView.builder
              Container(
                height: MediaQuery.of(context).size.height * 0.6,  // Adjust height as needed
                child: OrderDeailCustom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
