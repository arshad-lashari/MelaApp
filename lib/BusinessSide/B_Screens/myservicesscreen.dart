import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                  height: 143,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Cleaning'),
                            PopupMenuTheme(
                              data: PopupMenuThemeData(
                                color: Colors
                                    .white, // Set popup menu background color
                              ),
                              child: PopupMenuButton<String>(
                                onSelected: (String value) {
                                  print('Selected: $value');
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    PopupMenuItem<String>(
                                      child: Container(
                                        height:
                                            39, // Same height as the container
                                        width: double.infinity, // Full width
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons
                                                  .chevron_down_circle,
                                              color: Color(0xFF9C39FF),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'De Promote',
                                              style: TextStyle(
                                                color: Color(0xFF9C39FF),
                                                fontSize:
                                                    16, // Same font size as main text
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
                                          color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons
                                                  .chevron_down_circle,
                                              color: Color(0xFF9C39FF),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                color: Color(0xFF9C39FF),
                                                fontSize:
                                                    16, // Same font size as main text
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
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              CupertinoIcons
                                                  .chevron_down_circle,
                                              color: Color(0xFF9C39FF),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'De Promote',
                                              style: TextStyle(
                                                color: Color(0xFF9C39FF),
                                                fontSize:
                                                    16, // Same font size as main text
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ];
                                },
                                icon: const Icon(Icons.more_vert_outlined),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Center(child: Text('Content for Tab 2')),
        ],
      ),
    );
  }
}
