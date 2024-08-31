import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for TextInputFormatter
import 'package:mela/BusinessSide/B_Screens/CustomDesign/customtextfieldforaddservice.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
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
  double _pricePerDay = 0.0; // State variable for the price per day
  double _totalCost = 0.0; // State variable for the total cost

  void _increase() {
    setState(() {
      _days++;
      _updateTotalCost();
    });
  }

  void _decrease() {
    setState(() {
      if (_days > 0) {
        _days--;
        _updateTotalCost();
      }
    });
  }

  void _updateTotalCost() {
    setState(() {
      _totalCost = _days * _pricePerDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Select how many days you want to promote your service.',
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Select Days',
                style: TextStyle(
                    color: AppColors.darkblue,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: '$_days'),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFAFAFA), // Set fill color
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  suffixIcon: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            _increase();
                          },
                          child: const Icon(Icons.keyboard_arrow_up_rounded)),
                      GestureDetector(
                          onTap: () {
                            _decrease();
                          },
                          child: const Icon(Icons.keyboard_arrow_down_rounded))
                    ],
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _days = int.tryParse(value) ?? 0;
                    _updateTotalCost();
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Price Per Day',
                style: TextStyle(
                    color: AppColors.darkblue,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: TextField(
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow decimal input
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      r'^\d*\.?\d*')), // Allow only numbers and decimal points
                ],
                decoration: InputDecoration(
                  prefixText: '\$', // Add dollar sign as prefix
                  fillColor: const Color(0xFFFAFAFA), // Set fill color
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _pricePerDay =
                        double.tryParse(value.replaceAll('\$', '')) ?? 0.0;
                    _updateTotalCost();
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Total Cost',
                style: TextStyle(
                    color: AppColors.darkblue,
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: TextField(
                readOnly: true,
                controller: TextEditingController(
                    text: '\$${_totalCost.toStringAsFixed(2)}'),
                decoration: InputDecoration(
                  fillColor: const Color(0xFFFAFAFA), // Set fill color
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none, // Remove border
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.center,
                child: CustomButtonDesign(
                    buttonText: 'Promote', onPressed: () {})),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
