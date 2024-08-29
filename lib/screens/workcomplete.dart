import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/rateandreview.dart';

class WorkCompleScreen extends StatefulWidget {
  const WorkCompleScreen({super.key});

  @override
  State<WorkCompleScreen> createState() => _WorkCompleScreenState();
}

class _WorkCompleScreenState extends State<WorkCompleScreen> {
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
                  height: 200,
                  width: 200,
                  child: Image.asset(AppImagesPath.workcomplete)),
            ),
            const Text(
              'Work Completed',
              style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Ubuntu'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please review the service',
              style: TextStyle(
                  color: AppColors.darkblue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Ubuntu'),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(155, 50),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      'Reject',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(155, 50),
                        backgroundColor: Color(0xFF7ECA8A),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RateAndReviewClass(),
                          ));
                    },
                    child: const Text(
                      'Accept',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
