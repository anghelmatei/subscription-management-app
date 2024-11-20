import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subscriptions/view/add_subscription/add_subscription_view.dart';

import '../../common/color_extension.dart';
import '../calender/calender_view.dart';
import '../card/cards_view.dart';
import '../home/home_view.dart';
import '../spending_budgets/spending_budgets_view.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget currentTabView = const HomeView();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.secondary,
      body: Stack(children: [
        PageStorage(bucket: pageStorageBucket, child: currentTabView),
        SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Positioned(
                bottom: 0, // Ensure the navigation bar is positioned at the bottom
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0), // Removed horizontal padding to allow full-width background
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width, // Full width of the screen
                        height: 80, // Increase height of the background
                        decoration: BoxDecoration(
                          color: Colors.white, // Solid white background
                          borderRadius: BorderRadius.zero, // No rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildNavItem(
                              iconPath: "assets/img/home.png",
                              title: "Home",
                              index: 0,
                            ),
                            _buildNavItem(
                              iconPath: "assets/img/budgets.png",
                              title: "Budgets",
                              index: 1,
                            ),
                            const SizedBox(width: 50), // Space for the center button
                            _buildNavItem(
                              iconPath: "assets/img/calendar.png",
                              title: "Calendar",
                              index: 2,
                            ),
                            _buildNavItem(
                              iconPath: "assets/img/creditcards.png",
                              title: "Cards",
                              index: 3,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSubScriptionView()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(10), // Add padding for consistency
                          decoration: BoxDecoration(
                            color: TColor.primary,
                            boxShadow: [
                              BoxShadow(
                                color: TColor.secondary,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50), // Rounded corners for the add button
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/img/add.png",
                                width: 30,
                                height: 30, // Smaller image for the button
                                color: TColor.white,
                              ),
                              // const SizedBox(height: 4),
                              // Text(
                              //   "Add",
                              //   style: TextStyle(
                              //     color: TColor.white,
                              //     fontSize: 10,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildNavItem({
    required String iconPath,
    required String title,
    required int index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectTab = index;
          switch (index) {
            case 0:
              currentTabView = const HomeView();
              break;
            case 1:
              currentTabView = const SpendingBudgetsView();
              break;
            case 2:
              currentTabView = const CalenderView();
              break;
            case 3:
              currentTabView = const CardsView();
              break;
          }
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: selectTab == index ? TColor.primary : TColor.gray30,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: selectTab == index ? TColor.primary : TColor.gray30,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}