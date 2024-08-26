import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/screens/customdesign.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key});

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  DateTime _currentMonth = DateTime.now();
  List<String> days = [];
  List<String> dates = [];

  @override
  void initState() {
    super.initState();
    _generateDaysAndDates();
  }

  void _generateDaysAndDates() {
    int daysInMonth = _daysInMonth(_currentMonth.year, _currentMonth.month);
    days = List.generate(daysInMonth, (index) => _getDayOfWeek(DateTime(_currentMonth.year, _currentMonth.month, index + 1)));
    dates = List.generate(daysInMonth, (index) => (index + 1).toString());
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + offset);
      _generateDaysAndDates();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () => _changeMonth(-1),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      _getMonthName(_currentMonth.month),
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () => _changeMonth(1),
                ),
              ],
            ),
            CustomDateTimeDesign(
              days: days,
              dates: dates,
            ),
          ],
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

  String _getMonthName(int month) {
    switch (month) {
      case 1: return 'January';
      case 2: return 'February';
      case 3: return 'March';
      case 4: return 'April';
      case 5: return 'May';
      case 6: return 'June';
      case 7: return 'July';
      case 8: return 'August';
      case 9: return 'September';
      case 10: return 'October';
      case 11: return 'November';
      case 12: return 'December';
      default: return '';
    }
  }
}
