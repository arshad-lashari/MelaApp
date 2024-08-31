import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/cusotmforpromotedservice.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/custompromoted.dart';
import 'package:mela/BusinessSide/B_Screens/addservice.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  AppImagesPath appImagesPath = AppImagesPath();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Services',
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.darkblue,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.notifications_rounded),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Promoted'),
            Tab(text: 'Others'),
          ],
          labelColor: const Color(0xFF3B98D4), // Set selected tab color
          unselectedLabelColor: Colors.grey, // Set unselected tab color
          indicatorColor: const Color(0xFF3B98D4), // Set indicator color
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                CustomDePromotedServices(),
                CustomPromotedServices(),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 30,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddServiceScreen(),
                    ));
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: AppColors.bluescolor,
                    borderRadius: BorderRadius.circular(110)),
                // ignore: prefer_const_constructors
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
