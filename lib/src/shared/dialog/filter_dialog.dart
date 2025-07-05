import 'package:flutter/material.dart';

Future<void> showDateFilterDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Date Range',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildFilterOption(
                context,
                icon: Icons.today,
                title: 'Today',
                filter: DateFilter.today,
              ),
              _buildFilterOption(
                context,
                icon: Icons.calendar_view_day,
                title: 'Yesterday',
                filter: DateFilter.yesterday,
              ),
              _buildFilterOption(
                context,
                icon: Icons.calendar_view_week,
                title: 'This Week',
                filter: DateFilter.thisWeek,
              ),
              _buildFilterOption(
                context,
                icon: Icons.calendar_month,
                title: 'This Month',
                filter: DateFilter.thisMonth,
              ),
              _buildFilterOption(
                context,
                icon: Icons.date_range,
                title: 'Custom Date Range',
                filter: DateFilter.custom,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildFilterOption(BuildContext context,
    {required IconData icon, required String title, required DateFilter filter}) {
  return ListTile(
    leading: Icon(icon, color: Colors.blue),
    title: Text(
      title,
      style: TextStyle(fontSize: 16),
    ),
    onTap: () {
      Navigator.pop(context);
      handleFilterSelection(context, filter);
    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    hoverColor: Colors.blue.withOpacity(0.1),
    splashColor: Colors.blue.withOpacity(0.2),
  );
}

enum DateFilter { today, yesterday, thisWeek, thisMonth, custom }

void handleFilterSelection(BuildContext context, DateFilter filter) async {
  switch (filter) {
    case DateFilter.today:
      // Handle today's filter
      print("Today selected");
      break;
    case DateFilter.yesterday:
      // Handle yesterday's filter
      print("Yesterday selected");
      break;
    case DateFilter.thisWeek:
      // Handle this week's filter
      print("This Week selected");
      break;
    case DateFilter.thisMonth:
      // Handle this month's filter
      print("This Month selected");
      break;
    case DateFilter.custom:
      DateTimeRange? picked = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        print('Custom Range: ${picked.start} - ${picked.end}');
      }
      break;
  }}
