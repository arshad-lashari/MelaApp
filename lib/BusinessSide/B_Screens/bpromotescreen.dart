import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  AppColors appColors = AppColors();
  AppText appText = AppText();
  AppImagesPath appImagesPath = AppImagesPath();

  int _days = 0; // State variable to keep track of the number of days

  void _increase() {
    setState(() {
      _days++;
    });
  }

  void _decrease() {
    setState(() {
      if (_days > 0) {
        _days--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Promote',
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.darkblue),
        ),
        backgroundColor: AppColors.lightblue,
        leading: IconButton(
            style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
            onPressed: () {},
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select how many days you want to promote your service.',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: '$_days'),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIcon: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _increase();
                          },
                          child: Icon(Icons.keyboard_arrow_up_rounded)),
                      GestureDetector(
                          onTap: () {
                            _decrease();
                          },
                          child: Icon(Icons.keyboard_arrow_down_rounded))
                    ],
                  ),
                ),
                onChanged: (value) {
                  // Update the state when the user manually changes the number
                  setState(() {
                    _days = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
