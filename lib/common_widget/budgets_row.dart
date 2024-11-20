// import 'package:flutter/material.dart';
// import '../common/color_extension.dart';
//
// class BudgetsRow extends StatelessWidget {
//   final Map bObj;
//   final VoidCallback onPressed;
//
//   const BudgetsRow({super.key, required this.bObj, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     // Instead of calculating, just use the hardcoded values
//     String spentAmount = bObj["spend_amount"] ?? "0.00";  // Hardcoded spent amount
//     String leftAmount = bObj["left_amount"] ?? "0.00";    // Hardcoded left to spend amount
//     String totalBudget = bObj["total_budget"] ?? "0.00";  // Hardcoded total budget
//
//     // Calculate percentage of the budget spent (optional)
//     double proVal = (double.tryParse(leftAmount) ?? 0) / (double.tryParse(totalBudget) ?? 1);
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: onPressed,
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: TColor.border.withOpacity(0.05),
//             ),
//             color: TColor.gray80,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.asset(
//                       bObj["icon"], // Use the hardcoded icon
//                       width: 30,
//                       height: 30,
//                       color: TColor.gray40,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "€$spentAmount", // Hardcoded spent amount
//                           style: TextStyle(
//                               color: TColor.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "spent",
//                           style: TextStyle(
//                               color: TColor.gray30,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "€$leftAmount", // Hardcoded left to spend amount
//                         style: TextStyle(
//                             color: TColor.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         "left to spend",
//                         style: TextStyle(
//                             color: TColor.gray30,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               LinearProgressIndicator(
//                 backgroundColor: TColor.gray60,
//                 valueColor: AlwaysStoppedAnimation(bObj["color"]),
//                 minHeight: 3,
//                 value: proVal, // This is the progress indicator showing the percentage of the budget used
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../common/color_extension.dart';
//
// class BudgetsRow extends StatelessWidget {
//   final Map bObj;
//   final VoidCallback onPressed;
//
//   const BudgetsRow({super.key, required this.bObj, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     // Extracting values
//     String spentAmount = bObj["spend_amount"] ?? "0.00";  // Hardcoded spent amount
//     String leftAmount = bObj["left_amount"] ?? "0.00";    // Hardcoded left to spend amount
//     String totalBudget = bObj["total_budget"] ?? "0.00";  // Hardcoded total budget
//
//     // Calculate percentage of the budget spent
//     double spentValue = double.tryParse(spentAmount) ?? 0;
//     double totalValue = double.tryParse(totalBudget) ?? 1;
//     double leftValue = double.tryParse(leftAmount) ?? 0;
//
//     // Progress bar values
//     double proSpent = spentValue / totalValue;  // Progress for spent
//     double proLeft = leftValue / totalValue;    // Progress for left
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: onPressed,
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: TColor.border.withOpacity(0.05),
//             ),
//             color: TColor.gray80,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           alignment: Alignment.center,
//           child: Column(
//             children: [
//               // Category Title
//               Text(
//                 bObj["name"],  // Displaying category name
//                 style: TextStyle(
//                   color: TColor.white,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(height: 8),
//
//               // Row with spent and left to spend amounts
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.asset(
//                       bObj["icon"],  // Use the hardcoded icon
//                       width: 30,
//                       height: 30,
//                       color: TColor.gray40,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "€$spentAmount",  // Hardcoded spent amount
//                           style: TextStyle(
//                               color: TColor.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           "spent",
//                           style: TextStyle(
//                               color: TColor.gray30,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "€$leftAmount",  // Hardcoded left to spend amount
//                         style: TextStyle(
//                             color: TColor.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600),
//                       ),
//                       Text(
//                         "left to spend",
//                         style: TextStyle(
//                             color: TColor.gray30,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 8),
//
//               // Linear Progress Bar: Reversed logic
//               LinearProgressIndicator(
//                 backgroundColor: TColor.gray60,  // Grey part (left to spend)
//                 valueColor: AlwaysStoppedAnimation(bObj["color"]),  // Colored part (spent)
//                 minHeight: 3,
//                 value: proSpent,  // We set the spent value here
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../common/color_extension.dart';
//
// class BudgetsRow extends StatelessWidget {
//   final Map bObj;
//   final VoidCallback onPressed;
//
//   const BudgetsRow({super.key, required this.bObj, required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     // Extracting values from bObj
//     String spentAmount = bObj["spend_amount"] ?? "0.00";  // Hardcoded spent amount
//     String leftAmount = bObj["left_amount"] ?? "0.00";    // Hardcoded left to spend amount
//     String totalBudget = bObj["total_budget"] ?? "0.00";  // Hardcoded total budget
//
//     // Calculate percentage of the budget spent
//     double spentValue = double.tryParse(spentAmount) ?? 0;
//     double totalValue = double.tryParse(totalBudget) ?? 1;
//     double leftValue = double.tryParse(leftAmount) ?? 0;
//
//     // Progress bar values
//     double proSpent = spentValue / totalValue;  // Progress for spent
//     double proLeft = leftValue / totalValue;    // Progress for left
//
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),  // Added more space between cards
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: onPressed,
//         child: Container(
//           padding: const EdgeInsets.all(16),  // Increased padding for larger card
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: TColor.border.withOpacity(0.05),
//             ),
//             color: TColor.gray80,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,  // Align content to the left
//             children: [
//               // Title (Category name)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 12),  // Increased space below title
//                 child: Text(
//                   bObj["name"],  // Displaying category name
//                   style: TextStyle(
//                     color: TColor.white,
//                     fontSize: 20,  // Slightly bigger font for category name
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//
//               // Row with icon, spent and left to spend amounts
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),  // Increased padding for better spacing
//                     child: Image.asset(
//                       bObj["icon"],  // Use the hardcoded icon
//                       width: 45,  // Increased icon size to match the larger layout
//                       height: 45,
//                       color: TColor.gray40,
//                     ),
//                   ),
//                   const SizedBox(width: 16),  // Increased spacing between icon and text
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "€$spentAmount",  // Hardcoded spent amount
//                           style: TextStyle(
//                             color: TColor.white,
//                             fontSize: 18,  // Increased font size for better readability
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Text(
//                           "spent",
//                           style: TextStyle(
//                             color: TColor.gray30,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 16),  // More spacing
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "€$leftAmount",  // Hardcoded left to spend amount
//                         style: TextStyle(
//                           color: TColor.white,
//                           fontSize: 18,  // Increased font size for consistency
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         "left to spend",
//                         style: TextStyle(
//                           color: TColor.gray30,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 16),  // Spacing before progress bar
//
//               // Linear Progress Bar: Reversed logic
//               LinearProgressIndicator(
//                 backgroundColor: TColor.gray60,  // Grey part (left to spend)
//                 valueColor: AlwaysStoppedAnimation(bObj["color"]),  // Colored part (spent)
//                 minHeight: 6,  // Increased height for better visibility
//                 value: proLeft,  // Using 'proLeft' to reverse the progress bar logic
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../common/color_extension.dart';

class BudgetsRow extends StatelessWidget {
  final Map bObj;
  final VoidCallback onPressed;

  const BudgetsRow({super.key, required this.bObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Extracting values from bObj
    String spentAmount = bObj["spend_amount"] ?? "0.00";  // Hardcoded spent amount
    String leftAmount = bObj["left_amount"] ?? "0.00";    // Hardcoded left to spend amount
    String totalBudget = bObj["total_budget"] ?? "0.00";  // Hardcoded total budget

    // Calculate percentage of the budget spent
    double spentValue = double.tryParse(spentAmount) ?? 0;
    double totalValue = double.tryParse(totalBudget) ?? 1;
    double leftValue = double.tryParse(leftAmount) ?? 0;

    // Progress bar values
    double proSpent = spentValue / totalValue;  // Progress for spent
    double proLeft = leftValue / totalValue;    // Progress for left

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),  // Added more space between cards
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(16),  // Increased padding for larger card
          decoration: BoxDecoration(
            border: Border.all(
              color: TColor.border.withOpacity(0.05),
            ),
            color: TColor.gray80,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,  // Align content to the left
            children: [
              // Title (Category name)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),  // Increased space below title
                child: Text(
                  bObj["name"],  // Displaying category name
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 20,  // Slightly bigger font for category name
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              // Row with icon, spent and left to spend amounts
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),  // Increased padding for better spacing
                    child: Image.asset(
                      bObj["icon"],  // Use the hardcoded icon
                      width: 45,  // Increased icon size to match the larger layout
                      height: 45,
                      color: TColor.gray40,
                    ),
                  ),
                  const SizedBox(width: 16),  // Increased spacing between icon and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "€$spentAmount",  // Hardcoded spent amount
                          style: TextStyle(
                            color: TColor.white,
                            fontSize: 18,  // Increased font size for better readability
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
                  const SizedBox(width: 16),  // More spacing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "€$leftAmount",  // Hardcoded left to spend amount
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 18,  // Increased font size for consistency
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "left to spend",
                        style: TextStyle(
                          color: TColor.gray30,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),  // Spacing before progress bar

              // Linear Progress Bar: Reversed logic
              LinearProgressIndicator(
                backgroundColor: TColor.gray60,  // Grey part (left to spend)
                valueColor: AlwaysStoppedAnimation(bObj["color"]),  // Colored part (spent)
                minHeight: 6,  // Increased height for better visibility
                value: proSpent,  // Use proSpent here, to show spent value in the colored part
              ),
            ],
          ),
        ),
      ),
    );
  }
}
