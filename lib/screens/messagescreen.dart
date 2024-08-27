import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/customdesign.dart';

class Messagescreen extends StatefulWidget {
  const Messagescreen({super.key});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppColors appColors = AppColors();
  AppText appText = AppText();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(
              color: AppColors.darkblue,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w500,
              fontSize: 22),
        ),
        leading: Image.asset(AppImagesPath.profile),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: TextFieldDesign(
                  hintText: 'Search Message',
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Container(
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage(AppImagesPath.menprofile))),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Andy WaruWu'),
                                  Text('Support'),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Text('2.30'),
                          ],
                        ),
                      ),
                      const Divider(), // Add Divider after each item
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
