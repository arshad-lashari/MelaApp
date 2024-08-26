import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/productdetails.dart';
import 'package:mela/screens/productservice.dart';

class CustomButtonDesign extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButtonDesign({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  State<CustomButtonDesign> createState() => _CustomButtonDesignState();
}

class _CustomButtonDesignState extends State<CustomButtonDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.bluescolor,
            fixedSize: const Size(327, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: widget.onPressed,
        child: Text(
          widget.buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold),
        ));
  }
}

class TextFieldDesign extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;

  const TextFieldDesign({
    super.key,
    required this.hintText,
    this.prefixIcon,
  });

  @override
  State<TextFieldDesign> createState() => _TextFieldDesignState();
}

class _TextFieldDesignState extends State<TextFieldDesign> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319,
      height: 63,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightblack,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 0, color: Colors.transparent),
          ),
          hintText: widget.hintText,
          hintStyle:
              const TextStyle(fontSize: 16, color: AppColors.textfieldcolor),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}

class CategoriesCustom extends StatefulWidget {
  const CategoriesCustom({super.key});

  @override
  State<CategoriesCustom> createState() => _CategoriesCustomState();
}

class _CategoriesCustomState extends State<CategoriesCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();
  AppColors appColors = AppColors();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height - 270, // Adjust height as needed
      child: GridView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: appImagesPath.categoryimages.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 30,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailsScreen(),
                  ));
            },
            child: Column(
              children: [
                Image.asset(
                    appImagesPath.categoryimages[index]), // Fixed this line
                const SizedBox(
                  height: 18,
                ),
                Text(
                  appText.categoriestext[index],
                  style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ), // Assuming categories text is also a list
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomProductDetails extends StatefulWidget {
  const CustomProductDetails({super.key});

  @override
  State<CustomProductDetails> createState() => _CustomProductDetailsState();
}

class _CustomProductDetailsState extends State<CustomProductDetails> {
  AppImagesPath appImagesPath = AppImagesPath();
  AppText appText = AppText();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 220, // Increased height for better layout
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: appImagesPath
            .categoriesdetailsimages.length, // Adjust based on your data
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductServiceDetails(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 118,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              appImagesPath.categoriesdetailsimages[index])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            appText.productdetailtext[index],
                            style: const TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkblue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Cleaner',
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkblue,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 20,
                              color: Color(0xFFFFA873),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '5.0',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                              ),
                            ),
                            Spacer(),
                            Text(
                              '\$200',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.darkblue,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



class CustomDateTimeDesign extends StatefulWidget {
  final List<String> days;
  final List<String> dates;

  const CustomDateTimeDesign({
    super.key,
    required this.days,
    required this.dates,
  });

  @override
  State<CustomDateTimeDesign> createState() => _CustomDateTimeDesignState();
}

class _CustomDateTimeDesignState extends State<CustomDateTimeDesign> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54, // Adjust the height as needed
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.days.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = isSelected ? -1 : index;
                });
              },
              child: Container(
                height: 54,
                width: 41,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.lightBlue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.days[index],
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white : AppColors.darkblue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.dates[index],
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white : AppColors.darkblue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CustomTimeFormatDesign extends StatefulWidget {
  final List<String> time;
  final List<String> timeformat;

  const CustomTimeFormatDesign({
    super.key,
    required this.time,
    required this.timeformat,
  });

  @override
  State<CustomTimeFormatDesign> createState() => _CustomTimeFormatDesignState();
}

class _CustomTimeFormatDesignState extends State<CustomTimeFormatDesign> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54, // Adjust the height as needed
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.time.length, // Use widget.time.length instead of widget.days.length
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = isSelected ? -1 : index;
                });
              },
              child: Container(
                height: 54,
                width: 41,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.lightBlue : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.time[index], // Change widget.days[index] to widget.time[index]
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white : Colors.black, // Change AppColors.darkblue to Colors.black if AppColors is not defined
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.timeformat[index], // Change widget.dates[index] to widget.timeformat[index]
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white : Colors.black, // Change AppColors.darkblue to Colors.black if AppColors is not defined
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime today = DateTime.now();
  List<String> days = [];
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    _generateDaysAndDates();
  }

  void _generateDaysAndDates() {
    int daysInMonth = _daysInMonth(today.year, today.month);
    days = List.generate(daysInMonth, (index) => _getDayOfWeek(DateTime(today.year, today.month, index + 1)));
    dates = List.generate(daysInMonth, (index) => (index + 1).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        child: CustomDateTimeDesign(
          days: days,
          dates: dates,
        ),
      ),
    );
  }

  int _daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  String _getDayOfWeek(DateTime date) {
    switch (date.weekday) {
      case 1: return 'Mon';
      case 2: return 'Tue';
      case 3: return 'Wed';
      case 4: return 'Thu';
      case 5: return 'Fri';
      case 6: return 'Sat';
      case 7: return 'Sun';
      default: return '';
    }
  }
}
