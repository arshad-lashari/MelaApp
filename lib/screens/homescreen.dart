import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/customdesign.dart';
import 'package:mela/screens/productdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppColors appColors = AppColors();
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 243,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImagesPath.homeimage),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 213,
            left: 30,
            child: Container(
              height: 48,
              width: 327,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0, // Adjust blur as needed
                    offset: Offset(0, 5), // Adjust the shadow's position
                  ),
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 170,
                    child: TextField(
                      minLines: 1,
                      maxLines: 100,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 2,
                    color: Colors.black54,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 23,
                  ),
                  const SizedBox(width: 8), // Added spacing for better layout
                  const Text(
                    '18 Fish Street Hill',
                    style: TextStyle(fontSize: 10, fontFamily: 'Ubuntu'),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
              top: 460, // Adjust this value as needed for proper positioning
              left: 20,
              right: 20,
              child: CategoriesCustom()),
          Positioned(
            top: 285, // Adjust this value as needed for proper positioning
            left: 20,
            right: 20,
            child: Container(
              height: 191,
              width: 345,
              decoration: BoxDecoration(
                  color: AppColors.lightblue1,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Free Shipping',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'For purchases over 50\$',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu', fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Including all regions',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu', fontSize: 14),
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 6),
                                child: CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Deadline until October 13',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu', fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: 21,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 21,
                                  decoration: BoxDecoration(
                                    color: AppColors.bluescolor,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: const Align(
                                    alignment: Alignment.center,
                                    child: Text('Bay',style: TextStyle(
                                      color: Colors.white
                                    ),),
                                  ),
                                ),
                                const Icon(Icons.arrow_forward_ios,size: 14,color: Colors.black54,)
                              ],
                            ),
                          ),
                        ),
                      )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 200,
                      top: 25,
                      child: SizedBox(
                          height: 160,
                          width: 160,
                          child: Image.asset(AppImagesPath.delvryman)))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
