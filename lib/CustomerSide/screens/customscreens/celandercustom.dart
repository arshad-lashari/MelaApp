import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';

class MonthCalendar extends StatefulWidget {
  final void Function(DateTime date) onDateSelected;

  const MonthCalendar({super.key, required this.onDateSelected});

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  DateTime? selectedDate;
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Set your time',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Ubuntu',
                      color: AppColors.darkblue,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: () => _changeMonth(-1),
                    ),
                    Text(
                      _getMonthName(_currentMonth.month),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkblue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right),
                      onPressed: () => _changeMonth(1),
                    ),
                  ],
                )
              ],
            ),
            CustomDateTimeDesign(
              days: days,
              dates: dates,
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
                widget.onDateSelected(date); // Call the onDateSelected callback
              },
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
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

class CustomDateTimeDesign extends StatefulWidget {
  final List<String> days;
  final List<String> dates;
  final void Function(DateTime date) onDateSelected;

  const CustomDateTimeDesign({
    super.key,
    required this.days,
    required this.dates,
    required this.onDateSelected,
  });

  @override
  State<CustomDateTimeDesign> createState() => _CustomDateTimeDesignState();
}

class _CustomDateTimeDesignState extends State<CustomDateTimeDesign> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
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
                if (!isSelected) {
                  final selectedDate = DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    index + 1,
                  );
                  widget.onDateSelected(selectedDate);
                }
              },
              child: Container(
                height: 54,
                width: 41,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFb9AD6FB) : Colors.white,
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
