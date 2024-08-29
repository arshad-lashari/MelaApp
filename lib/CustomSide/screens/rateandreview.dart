import 'package:flutter/material.dart';
import 'package:mela/CustomSide/constant/colorspath.dart';
import 'package:mela/CustomSide/constant/imagespath.dart';
import 'package:mela/CustomSide/screens/customdesign.dart';

class RateAndReviewClass extends StatefulWidget {
  const RateAndReviewClass({super.key});

  @override
  State<RateAndReviewClass> createState() => _RateAndReviewClassState();
}

class _RateAndReviewClassState extends State<RateAndReviewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Added padding for a better look
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightblue,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Rate & Reviews',
          style: TextStyle(
            color: AppColors.darkblue,
            fontFamily: 'Ubuntu',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              color: AppColors.lightblue),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        size: 43,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 43,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 43,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 43,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 43,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Your Review',
                  style: TextStyle(
                    color: AppColors.darkblue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    height: 125,
                    width: double.infinity,
                    color: Colors.white,
                    child: const TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.black),
                      minLines: 1,
                      maxLines: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Write Review',
                        hintStyle: TextStyle(
                          color: Colors.black12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          width: 158,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(AppImagesPath.groundimage)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 120,
                          width: 158,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 24,
                              ),
                              Text(
                                'Add Picture',
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Align(
                    alignment: Alignment.center,
                    child: CustomButtonDesign(
                        buttonText: 'Submit', onPressed: () {})),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
