import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';

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
              color: Colors.white, fontSize: 16, fontFamily: 'Ubuntu',fontWeight: FontWeight.bold),
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
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.textfieldcolor
          ),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
