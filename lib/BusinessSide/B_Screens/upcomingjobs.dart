import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/orderdetialcustom.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';

class CompletedJobs extends StatefulWidget {
  const CompletedJobs({super.key});

  @override
  State<CompletedJobs> createState() => _CompletedJobsState();
}

class _CompletedJobsState extends State<CompletedJobs>
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

  @override
  void dispose() {
    _tabController.dispose();
    _titleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.3, // Adjust as needed
              top:
                  MediaQuery.of(context).size.height * 0.05, // Adjust as needed
              right: MediaQuery.of(context).size.height * 0.02,
              bottom:
                  MediaQuery.of(context).size.height * 0.04, // Adjust as needed
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<String>(
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
                const Icon(Icons.notifications),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Complete'),
              Tab(text: 'Upcoming'),
            ],
            indicatorColor: AppColors.darkblue,
            labelColor: AppColors.darkblue,
            unselectedLabelColor: Colors.grey,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 4),
                      child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.1, 0.1),
                                    spreadRadius: 1,
                                    blurRadius: 8)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: ListTile(
                            title: const Text(
                              'Irene foks',
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 16,
                                  color: Color(0xFF9AD6FB),
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: const Row(
                              children: [
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(AppText.date),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {},
                              child: Container(
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
                          )),
                    );
                  },
                ),
                OrderDeailCustom(
                  trailing: GestureDetector(
                    onTap: () {},
                    child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
