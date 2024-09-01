import 'package:flutter/material.dart';
import 'package:mela/CustomerSide/screens/customdesign.dart';
import 'package:mela/constant/apptext.dart';
import 'package:mela/constant/colorspath.dart';
import 'package:mela/constant/imagespath.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  AppText appText = AppText();

  // Sample data for plan features

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightblue,
      appBar: AppBar(
        backgroundColor: AppColors.lightblue,
        centerTitle: true,
        toolbarHeight: 90,
        title: const Text(
          'Subscription',
          style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.darkblue),
        ),
        leading: IconButton(
            style: IconButton.styleFrom(
                fixedSize: const Size(40, 40),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut urna at lorem pulvinar fringilla nec at justo.',
                    style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: appText.proplan.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        width: double.infinity,
                        height: 316,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.bluescolor, width: 2),
                            color: AppColors.lightblue,
                            borderRadius: BorderRadius.circular(35)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Spacer(),
                              Image.asset(
                                AppImagesPath.planepic,
                              ),
                              const Spacer(),
                              const Text(
                                'Business',
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 26,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.darkblue),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    appText.proplan[index],
                                    style: const TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkblue),
                                  ),
                                  const Text('/'),
                                  Text(
                                    appText.plantime[index],
                                    style: const TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.darkblue),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                  appText.planFeatures[index].length,
                                  (featureIndex) => Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Align(
                                              child: Icon(
                                                Icons.done,
                                                color: Color(0xFFF6BA17),
                                                size: 18,
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                              child: Text(
                                                appText.planFeatures[index]
                                                    [featureIndex],
                                                style: const TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              CustomButtonDesign(
                                  buttonText: 'Buy Now', onPressed: () {}),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
