import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';

class CustomButtonDesign extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor; // Optional parameter for button color

  const CustomButtonDesign({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor, // Optional: defaults to null
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
            backgroundColor: widget.buttonColor ??
                AppColors.bluescolor, // Use provided color or default
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
  final TextEditingController controller;

  const TextFieldDesign(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      required bool obscureText,
      required this.controller});

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
        cursorColor: Colors.black38,
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
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
        itemCount: widget.time
            .length, // Use widget.time.length instead of widget.days.length
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
                  color: isSelected ? const Color(0xFFb9AD6FB) : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.time[
                            index], // Change widget.days[index] to widget.time[index]
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected
                              ? Colors.white
                              : Colors
                                  .black, // Change AppColors.darkblue to Colors.black if AppColors is not defined
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.timeformat[
                            index], // Change widget.dates[index] to widget.timeformat[index]
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected
                              ? Colors.white
                              : Colors
                                  .black, // Change AppColors.darkblue to Colors.black if AppColors is not defined
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



//CustomDesingAndClass For

///khanam simple saa best h wse >>>??? to ap dekh lyn mjhy to sch me pyaara lgga
///lekin es py kch b or nh lg skna wrna pyaara nh lgna boly bbb ap h yaha