import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/ordercompletecustom.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/orderdetialcustom.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';

class CompleteAndUpComingJobs extends StatefulWidget {
  const CompleteAndUpComingJobs({super.key});

  @override
  State<CompleteAndUpComingJobs> createState() =>
      _CompleteAndUpComingJobsState();
}

class _CompleteAndUpComingJobsState extends State<CompleteAndUpComingJobs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<String> _titleNotifier =
      ValueNotifier<String>('Completed Jobs');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        // Update title based on the selected tab index
        if (_tabController.index == 1) {
          _titleNotifier.value = 'Upcoming Jobs';
        } else {
          _titleNotifier.value = 'Completed Jobs';
        }
      });
  }

  AppText appText = AppText();

  @override
  void dispose() {
    _tabController.dispose();
    _titleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false, // Remove back icon
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.notifications),
          ),
        ],
        title: ValueListenableBuilder<String>(
          valueListenable: _titleNotifier,
          builder: (context, title, child) {
            return Text(
              title,
              style: const TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.darkblue,
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Complete'),
              Tab(text: 'Upcoming'),
            ],
            labelColor: Color(0xFF3B98D4), // Set selected tab color
            unselectedLabelColor: Colors.grey, // Set unselected tab color
            indicatorColor: Color(0xFF3B98D4),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                const OrderCompletCustom(),
                OrderDeailCustom(
                  trailing: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9AD6FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      CupertinoIcons.chat_bubble,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
