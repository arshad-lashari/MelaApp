import 'package:flutter/material.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/productservicehomeviewcustom.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails>
    with SingleTickerProviderStateMixin {
  AppText appText = AppText();
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Column(
        children: [
          const ProductServiceHomeImageDetailsCustom(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'Royal Cleaners are very competent in doing her job. '
              'We are the best worker who is very disciplined in '
              'any case. We will do the job according to '
              'what you want.. Read More',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Ubuntu',
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black54,
            ),
            title: Text(AppText.name),
            subtitle: Text(AppText.date),
          ),
          const Spacer(),
          CustomButtonDesign(
            buttonColor: const Color(0xFF59C36A),
            buttonText: 'Mark as Complete',
            onPressed: () {},
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
