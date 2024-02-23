import 'package:dot_navigation_bar/dot_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:todo/app/data/data/app_colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.onTap,
  });
  final Function(int index) onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DotNavigationBar(
      onTap: (p0) {
        setState(() {
          index = p0;
        });
        widget.onTap(p0);
      },
      dotIndicatorColor: Colors.black,
      unselectedItemColor: AppColors.kFilledColor,
      currentIndex: index,
      items: [
        DotNavigationBarItem(
          icon: const Icon(Icons.home),
          selectedColor: AppColors.kPrimary,
          unselectedColor: AppColors.kFilledColor,
        ),

        /// Likes
        DotNavigationBarItem(
          icon: const Icon(
            Icons.date_range,
          ),
          selectedColor: AppColors.kPrimary,
          unselectedColor: AppColors.kFilledColor,
        ),

        /// Search
        DotNavigationBarItem(
          icon: const Icon(
            Icons.search,
          ),
          selectedColor: AppColors.kPrimary,
          unselectedColor: AppColors.kFilledColor,
        ),

        /// Profile
        DotNavigationBarItem(
          icon: const Icon(
            Icons.add,
          ),
          selectedColor: AppColors.kPrimary,
          unselectedColor: AppColors.kFilledColor,
        ),
      ],
    );
  }
}
