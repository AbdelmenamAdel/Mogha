import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/utils/app_colors.dart';

class CustomGNavBar extends StatelessWidget {
  const CustomGNavBar({
    super.key,
    required this.currentIndex,
    this.onTabChange,
    required this.tabs,
  });
  final int currentIndex;
  final void Function(int)? onTabChange;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: GNav(
          color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          activeColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          selectedIndex:currentIndex,
          tabBackgroundColor: AppColors.grey.withOpacity(0.3),
          padding: const EdgeInsets.all(16),
          tabBorderRadius: 16,
          gap: 8,
          onTabChange: onTabChange,
          tabs: tabs,
        ),
      ),
    );
  }
}
