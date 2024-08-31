import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';

class CustomPromotedServices extends StatefulWidget {
  const CustomPromotedServices({super.key});

  @override
  State<CustomPromotedServices> createState() => _CustomPromotedServicesState();
}

class _CustomPromotedServicesState extends State<CustomPromotedServices>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  AppColors appColors = AppColors();
  AppText appText = AppText();

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
    return Scaffold(
        body: PopupMenuTheme(
      data: PopupMenuThemeData(
        color: Colors.white, // Set the background color of the popup menu
        elevation: 4, // Set the shadow elevation (default is 8)
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5), // Optional: add rounded corners
        ),
      ),
      child: ListView.builder(
        itemCount: appText.completepronames.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.1, 0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              appText.completepronames[index],
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                              ),
                            ),
                            PopupMenuButton<String>(
                              onSelected: (String value) {
                                print('Selected: $value');
                              },
                              itemBuilder: (BuildContext context) {
                                return [
                                  PopupMenuItem<String>(
                                    child: Container(
                                      height: 39,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            CupertinoIcons.chevron_down_circle,
                                            color: Color(0xFF9C39FF),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            'Promote',
                                            style: TextStyle(
                                              color: Color(0xFF9C39FF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: Container(
                                      height: 39,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.lightblue,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.edit,
                                            color: AppColors.bluescolor,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: AppColors.bluescolor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem<String>(
                                    child: Container(
                                      height: 39,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.red[50],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.delete_sharp),
                                          SizedBox(width: 10),
                                          Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ];
                              },
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Colors.red, // Changed color to red
                              ),
                              // Theme to change popup menu background color
                              offset: const Offset(0, 40), // Optional offset
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tags here',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.bluescolor,
                              ),
                            ),
                            Text('\$50')
                          ],
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur '
                          'adipiscing elit, sed do eiusmod tempor '
                          'incididunt ut labore et dolore magna '
                          'aliqua. Ut enim ad minim veniam.',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
