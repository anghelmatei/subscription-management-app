import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class BudgetsRow extends StatelessWidget {
  final Map bObj;
  final VoidCallback onPressed;

  const BudgetsRow({super.key, required this.bObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String spentAmount = bObj["spend_amount"] ?? "0.00";
    String leftAmount = bObj["left_amount"] ?? "0.00";
    String totalBudget = bObj["total_budget"] ?? "0.00";

    double spentValue = double.tryParse(spentAmount) ?? 0;
    double totalValue = double.tryParse(totalBudget) ?? 1;
    double leftValue = double.tryParse(leftAmount) ?? 0;

    double proSpent = spentValue / totalValue;
    double proLeft = leftValue / totalValue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: TColor.border.withOpacity(0.05),
            ),
            color: TColor.gray80,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  bObj["name"],
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      bObj["icon"],
                      width: 45,
                      height: 45,
                      color: TColor.gray40,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "€$spentAmount",
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "spent",
                          style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "€$leftAmount",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "left",
                          style: TextStyle(
                            color: TColor.gray30,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                backgroundColor: TColor.gray60,
                valueColor: AlwaysStoppedAnimation(bObj["color"]),
                minHeight: 6,
                value: proSpent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
