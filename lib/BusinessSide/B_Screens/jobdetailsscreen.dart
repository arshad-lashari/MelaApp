import 'package:flutter/material.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
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
         Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppColors.lightblue,
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_constructors
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
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
    ),
 
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
