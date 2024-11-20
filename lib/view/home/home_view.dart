import 'package:flutter/material.dart';
import 'package:subscriptions/common/color_extension.dart';
import '../../common_widget/custom_arc_painter.dart';
import '../../common_widget/segment_button.dart';
import '../../common_widget/status_button.dart';
import '../../common_widget/subscription_home_row.dart';
import '../../common_widget/upcoming_bill_row.dart';
import '../subscription_info/subscription_info_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isSubscription = true;
  List subArr = [
    {"name": "Spotify", "icon": "assets/img/spotify_logo.png", "price": "€5.99"},
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "€18.99"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "€29.99"
    },
    {"name": "Netflix", "icon": "assets/img/netflix_logo.png", "price": "€18.29"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(end: 220),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: media.width * 0.08,
                      ),
                      Image.asset("assets/img/app_logo.png",
                          width: media.width * 0.30, fit: BoxFit.contain),
                      SizedBox(
                        height: media.width * 0.10,
                      ),
                      const Text(
                        "€73.26",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 55,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: media.width * 0.055,
                      ),
                      SizedBox(
                        height: media.width * 0.20,
                      ),
                      Text(
                        "Total subscriptions for this month",
                        style: TextStyle(
                            color: TColor.gray40,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  // Added SizedBox to push the row of containers further down
                  SizedBox(
                    height: media.width * 0.60, // Adjust height as needed
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Highest subscription",
                                value: "€29.99",
                                statusColor: TColor.primary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Active subscription",
                                value: "4",
                                statusColor: TColor.primary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Lowest subscription",
                                value: "€5.99",
                                statusColor: TColor.primary,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              height: 50,
              decoration: BoxDecoration(
                  color: TColor.gray80, borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Expanded(
                    child: SegmentButton(
                      title: "Your subscription",
                      isActive: isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: SegmentButton(
                      title: "Upcoming bills",
                      isActive: !isSubscription,
                      onPressed: () {
                        setState(() {
                          isSubscription = !isSubscription;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (isSubscription)
              ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};

                    return SubScriptionHomeRow(
                      sObj: sObj,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SubscriptionInfoView(sObj: sObj)));
                      },
                    );
                  }),
            if (!isSubscription)
              ListView.builder(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subArr.length,
                  itemBuilder: (context, index) {
                    var sObj = subArr[index] as Map? ?? {};

                    return UpcomingBillRow(
                      sObj: sObj,
                      onPressed: () {},
                    );
                  }),
            const SizedBox(
              height: 110,
            ),
          ],
        ),
      ),
    );
  }
}
