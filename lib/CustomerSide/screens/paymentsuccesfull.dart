import 'package:flutter/material.dart';
import 'package:mela/CustomerSide/screens/bottomnav.dart';
import 'package:mela/CustomerSide/screens/homescreen.dart';
import 'package:mela/CustomerSide/screens/rateandreview.dart';
import 'package:mela/CustomerSide/screens/workcomplete.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';

class PayMentSuccessfullScreen extends StatefulWidget {
  const PayMentSuccessfullScreen({super.key});

  @override
  State<PayMentSuccessfullScreen> createState() =>
      _PayMentSuccessfullScreenState();
}

class _PayMentSuccessfullScreenState extends State<PayMentSuccessfullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 308,
                  height: 275,
                  child: Image.asset(AppImagesPath.paymentsuccesfull)),
            ),
            const Text(
              'Payment succesfull',
              style: TextStyle(
                color: AppColors.darkblue,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            const Spacer(),
            CustomButtonDesign(
                buttonText: 'Rate & Review Service',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RateAndReviewClass(),
                      ));
                }),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(),
                    ));
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Ubuntu',
                    color: AppColors.bluescolor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
