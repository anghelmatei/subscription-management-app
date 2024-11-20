import 'dart:math';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/view/settings/settings_view.dart';
import '../../common_widget/subscription_cell.dart';

class CalenderView extends StatefulWidget {
  const CalenderView({super.key});

  @override
  State<CalenderView> createState() => _CalenderViewState();
}

class _CalenderViewState extends State<CalenderView> {
  CalendarAgendaController calendarAgendaControllerNotAppBar =
  CalendarAgendaController();
  late DateTime selectedDateNotAppBBar;

  Random random = Random();

  List subArr = [
    {
      "name": "Spotify",
      "icon": "assets/img/spotify_logo.png",
      "price": "€5.99",
      "date": "15.11.2024"
    },
    {
      "name": "YouTube Premium",
      "icon": "assets/img/youtube_logo.png",
      "price": "€18.99",
      "date": "20.11.2024"
    },
    {
      "name": "Microsoft OneDrive",
      "icon": "assets/img/onedrive_logo.png",
      "price": "€29.99",
      "date": "25.11.2024"
    },
    {
      "name": "Netflix",
      "icon": "assets/img/netflix_logo.png",
      "price": "€15.00",
      "date": "30.11.2024"
    }
  ];

  @override
  void initState() {
    super.initState();
    selectedDateNotAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Calendar Title and Subscription Info
            _buildHeader(),

            // Calendar Section
            _buildCalendarSection(),

            // Subscription Grid Section (with Outlined Containers)
            _buildSubscriptionGrid(),

            const SizedBox(height: 130),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: TColor.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Subscriptions\nSchedule",
                style: TextStyle(
                  color: TColor.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // Date Selector
              _buildDateSelector(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            calendarAgendaControllerNotAppBar.openCalender();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: TColor.border.withOpacity(0.1),
              ),
              color: TColor.gray60.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  "November",
                  style: TextStyle(
                    color: TColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.expand_more,
                  color: TColor.white,
                  size: 16.0,
                ),
              ],
            ),
          ),
        ),
        Text(
          "2 subscriptions due today",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarSection() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CalendarAgenda(
        controller: calendarAgendaControllerNotAppBar,
        backgroundColor: Colors.transparent,
        fullCalendarBackgroundColor: TColor.gray80,
        locale: 'en',
        weekDay: WeekDay.short,
        fullCalendarDay: WeekDay.short,
        selectedDateColor: TColor.white,
        initialDate: DateTime.now(),
        calendarEventColor: TColor.secondary,
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now().add(const Duration(days: 140)),
        events: List.generate(
          100,
              (index) => DateTime.now().subtract(
            Duration(days: index * random.nextInt(5)),
          ),
        ),
        onDateSelected: (date) {
          setState(() {
            selectedDateNotAppBBar = date;
          });
        },
        decoration: BoxDecoration(
          border: Border.all(
            color: TColor.border.withOpacity(0.15),
          ),
          color: TColor.gray60.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        selectDecoration: BoxDecoration(
          border: Border.all(
            color: TColor.border.withOpacity(0.15),
          ),
          color: TColor.gray60,
          borderRadius: BorderRadius.circular(12),
        ),
        selectedEventLogo: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: TColor.secondary,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        eventLogo: Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            color: TColor.secondary,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0, // Adjusted for larger cards
        ),
        itemCount: subArr.length,
        itemBuilder: (context, index) {
          var sObj = subArr[index] as Map? ?? {};
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: TColor.primaryText, // Outline color
                width: 2.0, // Border width
              ),
            ),
            child: Card(
              elevation: 0, // Remove shadow by setting elevation to 0
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: TColor.white, // Card background color
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Subscription Icon (Larger size)
                    Image.asset(
                      sObj["icon"] ?? "",
                      width: 80, // Larger icon
                      height: 80,
                    ),
                    const SizedBox(height: 12),
                    // Subscription Name (Larger font size)
                    Text(
                      sObj["name"] ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20, // Larger font for title
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subscription Price (Larger font size)
                    Text(
                      sObj["price"] ?? "",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 18, // Larger font for price
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Subscription Date (Positioned at the bottom)
                    Spacer(),
                    Text(
                      sObj["date"] ?? "",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
