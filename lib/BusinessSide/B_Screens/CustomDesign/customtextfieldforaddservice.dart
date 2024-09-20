import 'package:flutter/material.dart';
import 'package:mela/constant/colorspath.dart';

class CustomTextFieldForAddtags extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final controller;

  const CustomTextFieldForAddtags({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon, this.controller,
  });

  @override
  State<CustomTextFieldForAddtags> createState() =>
      _CustomTextFieldForAddtagsState();
}

class _CustomTextFieldForAddtagsState extends State<CustomTextFieldForAddtags> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tags = [];

  void _addTag() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tags.add(text);
        _controller.clear();
      });
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
          width: double.infinity,
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Replace with your AppColors.bluescolor
                  fixedSize: const Size(18, 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: _addTag,
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
              prefixIcon: widget.prefixIcon,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: _tags.map((tag) {
            return GestureDetector(
              onTap: () => _removeTag(tag),
              child: Container(
                height: 32,
                width: 149,
                decoration: BoxDecoration(
                  color: const Color(0xFFD1EEFF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    tag,
                    style: const TextStyle(
                      color: AppColors.darkblue, // Dark blue text color
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


class CAddServiceTextfield extends StatefulWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color fillColor; // Added fillColor parameter
  final Color borderColor; // Added borderColor parameter
  final controller;

  const CAddServiceTextfield({
    Key? key,
    this.hintText = 'laahair',
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor = Colors.white, // Default value
    this.borderColor = Colors.white, this.controller, // Default value
  }) : super(key: key);

  @override
  State<CAddServiceTextfield> createState() => _CAddServiceTextfieldState();
}

class _CAddServiceTextfieldState extends State<CAddServiceTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
          fillColor: widget.fillColor, // Use fillColor parameter
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: widget.borderColor), // Use borderColor parameter
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: widget.borderColor), // Use borderColor parameter
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: widget.borderColor), // Use borderColor parameter
          ),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
