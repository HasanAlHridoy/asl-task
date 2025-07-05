import 'package:asl_task/src/core/router/app_routers.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Widget child;
  const CustomBottomNavBar({super.key, required this.child});
  static const String name = 'bottom-nav-bar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getSelectedIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(AppRoutes.homeRoute);
              break;
            // case 1:
            //   context.go(AppRoutes.attendanceRoute);
            //   break;
            // case 2:
            //   context.go(AppRoutes.employeeRoute);
            //   break;
            // case 1:
              // context.go(AppRoutes.profileRoute);
              break;
          }
        },
        backgroundColor: context.theme.cardColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          // BottomNavigationBarItem(icon: Icon(Icons.assignment_turned_in_sharp), label: ''),
          // BottomNavigationBarItem(icon: Icon(Icons.miscellaneous_services), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_3), label: ''),
        ],
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    // if (location.startsWith(AppRoutes.profileRoute)) return 1;
    // if (location.startsWith(AppRoutes.employeeRoute)) return 2;
    // if (location.startsWith(AppRoutes.profileRoute)) return 3;
    return 0;
  }
}
