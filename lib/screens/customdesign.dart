import 'package:flutter/material.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/screens/productdetails.dart';

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
          hintStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.textfieldcolor
          ),
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
AppImagesPath appImagesPath=AppImagesPath();
AppText appText=AppText();
AppColors appColors=AppColors();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: MediaQuery.of(context).size.height - 270, // Adjust height as needed
    child: GridView.builder(
      itemCount: appImagesPath.categoryimages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetailsScreen(),));
          },
          child: Column(
            children: [
              Image.asset(appImagesPath.categoryimages[index]), // Fixed this line
              const SizedBox(height: 18,),
              Text(appText.categoriestext[index],style: const TextStyle(
                fontFamily: 'Ubuntu',fontSize: 10,fontWeight: FontWeight.w400
              ),), // Assuming categories text is also a list
            ],
          ),
        );
      },
    ),
  );
  
  }
}
