import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/common_widget/budgets_row.dart';
import 'package:trackizer/common_widget/custom_arc_180_painter.dart';

class SpendingBudgetsView extends StatefulWidget {
  const SpendingBudgetsView({super.key});

  @override
  State<SpendingBudgetsView> createState() => _SpendingBudgetsViewState();
}

class _SpendingBudgetsViewState extends State<SpendingBudgetsView> {
  List budgetArr = [
    {
      "name": "Car & Transport",
      "icon": "assets/img/auto_&_transport.png",
      "spend_amount": "412.63",
      "total_budget": "600.00",
      "left_amount": "187.37",
      "color": TColor.primary10
    },
    {
      "name": "Entertainment",
      "icon": "assets/img/cinema.png",
      "spend_amount": "284.46",
      "total_budget": "600.00",
      "left_amount": "315.54",
      "color": TColor.secondary50
    },
    {
      "name": "Travel",
      "icon": "assets/img/passport.png",
      "spend_amount": "176.94",
      "total_budget": "600.00",
      "left_amount": "423.06",
      "color": TColor.secondaryG
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: media.width * 0.7,
                    height: media.width * 0.45,
                    child: CustomPaint(
                      painter: CustomArc180Painter(
                        drwArcs: [
                          ArcValueModel(color: TColor.secondaryG, value: 20),
                          ArcValueModel(color: TColor.secondary, value: 45),
                          ArcValueModel(color: TColor.primary10, value: 70),
                        ],
                        end: 50,
                        width: 12,
                        bgWidth: 8,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "€182.90",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 55,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "of €2,000 budget",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: Container(
                  height: 64,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Your budgets are on track 👍",
                        style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // Updated ListView builder
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: budgetArr.length,
              itemBuilder: (context, index) {
                var bObj = budgetArr[index] as Map? ?? {};
                return BudgetsRow(
                  bObj: bObj,
                  onPressed: () {},
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {},
                child: DottedBorder(
                  dashPattern: const [5, 4],
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(16),
                  color: TColor.primaryText,
                  child: Container(
                    height: 64,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add new category ",
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          "assets/img/add.png",
                          width: 12,
                          height: 12,
                          color: TColor.primaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 110),
          ],
        ),
      ),
    );
  }
}
