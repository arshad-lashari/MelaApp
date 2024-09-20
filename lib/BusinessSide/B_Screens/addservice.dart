import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mela/BusinessSide/B_Screens/CustomDesign/customtextfieldforaddservice.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';
import 'package:http/http.dart' as http;

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  AppColors appColors = AppColors();
  AppText appText = AppText();
  AppImagesPath appImagesPath = AppImagesPath();

  // Controllers for text fields
  TextEditingController serviceController = TextEditingController();
  TextEditingController specialtiesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController categorynamecontroller = TextEditingController();

  Future<void> addService(
      BuildContext context,
      String businessId,
      String categoryName,
      String serviceName,
      String speciality,
      String price,
      String description,
      String pic,
      String location) async {
    try {
      // Define the API endpoint
      final response = await http.post(
        Uri.parse('https://mela-backend.vercel.app/business/addservice'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'businessId': businessId,
          'categoryName': categoryName,
          'serviceName': serviceName,
          'speciality': speciality,
          'price': price,
          'description': description,
          'pic': pic, // This can be a URL or base64 encoded image
          'location': location,
        }),
      );

      // Check for success response
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Service added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Show error if response is not successful
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add service: ${response.body}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle any exceptions or errors during the API call
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  final List<String> _services = ['Cleaner', 'Home Cleaner', 'Car Cleaner'];
  String? _selectedService;

  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? pickedImage = await _picker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _showImageSourceOptions() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              icon: const Icon(
                Icons.image,
                color: Colors.black54,
              ),
              label: const Text(
                'Gallery',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _pickImage(ImageSource.gallery);
              },
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.black54,
              ),
              label: const Text(
                'Camera',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        backgroundColor: AppColors.lightblue,
        title: const Text(
          'Add Service',
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.darkblue),
        ),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              GestureDetector(
                onTap: _showImageSourceOptions,
                child: Container(
                  height: 158,
                  width: 158,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.photo,
                              color: Colors.black54,
                              size: 24,
                            ),
                            Text(
                              'Add Picture',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Service',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedService,
                  hint: const Text('Select Service'),
                  items: _services.map((String service) {
                    return DropdownMenuItem<String>(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedService = newValue;
                      serviceController.text =
                          newValue ?? ''; // Update controller
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Categoryname',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _selectedService,
                  hint: const Text('Select Service'),
                  items: _services.map((String service) {
                    return DropdownMenuItem<String>(
                      value: service,
                      child: Text(service),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedService = newValue;
                      categorynamecontroller.text =
                          newValue ?? ''; // Update controller
                    });
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Specialties',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              CustomTextFieldForAddtags(
                controller: specialtiesController, // Pass the controller
                hintText: 'Add Specialties',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Price',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              CAddServiceTextfield(
                controller: priceController, // Pass the controller
                hintText: 'Enter Price',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'location',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              CAddServiceTextfield(
                controller: locationcontroller, // Pass the controller
                hintText: 'Enter location',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkblue),
                ),
              ),
              const SizedBox(height: 7),
              Container(
                height: 125,
                color: Colors.white,
                child: CAddServiceTextfield(
                  controller: descriptionController, // Pass the controller
                  hintText: 'Description',
                ),
              ),
              SizedBox(height: 25),
              CustomButtonDesign(
                  buttonText: 'Save',
                  onPressed: () {
                    addService(
                        context,
                        '66ed535f50c3b04c3ef885de', // businessId
                        categorynamecontroller.text, // categoryName
                        serviceController.text, // serviceName
                        specialtiesController.text, // speciality
                        priceController.text, // price
                        descriptionController.text, // description
                        _image != null
                            ? base64Encode(_image!.readAsBytesSync())
                            : '', // pic (if image is picked)
                        locationcontroller.text // location
                        );
                  }),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
