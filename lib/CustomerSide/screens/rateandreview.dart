import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';

class RateAndReviewClass extends StatefulWidget {
  const RateAndReviewClass({super.key});

  @override
  State<RateAndReviewClass> createState() => _RateAndReviewClassState();
}

class _RateAndReviewClassState extends State<RateAndReviewClass> {
  File? image;
  final picker = ImagePicker();
  int selectedRating = 0; // Variable to track the selected rating

  // Function to pick an image
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  // Function to show options for picking an image
  void _showImageSourceSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                    pickImage(ImageSource.camera);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Camera'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                    pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(height: 8),
                        Text('Gallery'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to handle star tap
  void _handleStarTap(int index) {
    setState(() {
      selectedRating = index + 1; // Update the selected rating
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0), // Added padding for a better look
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightblue,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Rate & Reviews',
          style: TextStyle(
            color: AppColors.darkblue,
            fontFamily: 'Ubuntu',
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: AppColors.lightblue,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () => _handleStarTap(index),
                              child: Icon(
                                Icons.star,
                                size: 43,
                                color: index < selectedRating
                                    ? AppColors
                                        .yellow // Use the existing yellow color
                                    : Colors
                                        .black12, // Gray for unselected stars
                              ),
                            );
                          }),
                        ),
                      ),
                      const Text(
                        'Your Review',
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 125,
                        width: double.infinity,
                        color: Colors.white,
                        child: const TextField(
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                          minLines: 1,
                          maxLines: 20,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Write Review',
                            hintStyle: TextStyle(
                              color: Colors.black12,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 158,
                                decoration: BoxDecoration(
                                  image: image != null
                                      ? DecorationImage(
                                          image: FileImage(image!),
                                          fit: BoxFit.cover,
                                        )
                                      : const DecorationImage(
                                          image: AssetImage(
                                              AppImagesPath.groundimage),
                                          fit: BoxFit.cover,
                                        ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: _showImageSourceSelection,
                                child: Container(
                                  height: 120,
                                  width: 158,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_outlined,
                                        size: 24,
                                      ),
                                      Text(
                                        'Add Picture',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButtonDesign(
                          buttonText: 'Submit',
                          onPressed: () {
                            // Submit action
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
