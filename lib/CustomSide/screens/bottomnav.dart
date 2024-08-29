
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/CustomSide/screens/homescreen.dart';
import 'package:mela/CustomSide/screens/messagescreen.dart';
import 'package:mela/CustomSide/screens/userprofile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  // List of widget pages
  final List<Widget> _pages = [
    const HomeScreen(),
    const Messagescreen(),
    CartPage(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pages[_currentIndex],
   bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.white,
  type: BottomNavigationBarType.fixed, // For more than 3 items
  currentIndex: _currentIndex,
  selectedItemColor: Colors.white, // Color for the selected item
  unselectedItemColor: Colors.grey, // Color for the unselected items
  showSelectedLabels: false, // Hide the selected label
  showUnselectedLabels: false, // Hide the unselected labels
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  items: [
    BottomNavigationBarItem(
      icon: _buildIconWithBackground(0, Icons.home_outlined,),
      label: '', // Empty label
    ),
    BottomNavigationBarItem(
      icon: _buildIconWithBackground(1, CupertinoIcons.chat_bubble_text),
      label: '', // Empty label
    ),
    BottomNavigationBarItem(
      icon: _buildIconWithBackground(2, CupertinoIcons.macwindow),
      label: '', // Empty label
    ),
    BottomNavigationBarItem(
      icon: _buildIconWithBackground(3,CupertinoIcons.person),
      label: '', // Empty label
    ),
  ],
),

    );
  }

  // Helper function to build the icon with the custom background color for the selected item
  Widget _buildIconWithBackground(int index, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _currentIndex == index ? const Color(0xFF9AD6FB) : Colors.transparent, // Apply the #9AD6FB color to the selected container
      ),
      child: Icon(
        icon,
        color: _currentIndex == index ? Colors.white : Colors.grey, // Change icon color based on selection
      ),
    );
  }
}



// Cart Screen
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Cart Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Profile Screen
