import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:subscriptions/common/color_extension.dart';
import 'package:subscriptions/common_widget/primary_button.dart';
import 'package:subscriptions/common_widget/round_textfield.dart';

import '../../common_widget/image_button.dart';

class AddSubScriptionView extends StatefulWidget {
  const AddSubScriptionView({super.key});

  @override
  State<AddSubScriptionView> createState() => _AddSubScriptionViewState();
}

class _AddSubScriptionViewState extends State<AddSubScriptionView> {
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtPrice = TextEditingController();

  List subArr = [
    {"name": "HBO GO", "icon": "assets/img/hbo_logo.png"},
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png"},
    {"name": "YouTube Premium", "icon": "assets/img/youtube_logo.png"},
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
    },
    {"name": "Netflix", "icon": "assets/img/netflix_logo.png"}
  ];

  double amountVal = 0.00; // Initialize with 0.00

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: TColor.gray30,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Add new\n subscription",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    width: media.width,
                    height: media.width * 0.6,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 1,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.65,
                        enlargeFactor: 0.4,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      itemCount: subArr.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        var sObj = subArr[itemIndex] as Map? ?? {};

                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                sObj["icon"],
                                width: media.width * 0.4,
                                height: media.width * 0.4,
                                fit: BoxFit.fitHeight,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                sObj["name"],
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: RoundTextField(
              title: "Notes",
              titleAlign: TextAlign.center,
              controller: txtDescription,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageButton(
                  image: "assets/img/minus.png",
                  onPressed: () {
                    setState(() {
                      // Decrease amountVal but ensure it doesn't go below 0
                      amountVal = (amountVal - 1).clamp(0.00, double.infinity);
                    });
                  },
                ),
                Column(
                  children: [
                    Text(
                      "Monthly price",
                      style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    // Display the amount as a fixed number
                    Text(
                      // Show amountVal formatted with two decimal places
                      "${amountVal.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.black, // Ensure the price is black
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Hide the keyboard when tapping on the underline
                        FocusScope.of(context).unfocus();
                      },
                      child: Container(
                        width: 150,
                        height: 1,
                        color: TColor.gray70,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                ImageButton(
                  image: "assets/img/plus.png",
                  onPressed: () {
                    setState(() {
                      // Increase amountVal by 1
                      amountVal += 1;
                    });
                  },
                ),
              ],
            ),
          ),

          // Spacer to push the button to the bottom of the screen
          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              title: "Add this subscription",
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 20), // Optional spacing at the bottom
        ],
      ),
    );
  }
}
