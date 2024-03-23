import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../core/utils/app_colors.dart';

class CustomGNavBar extends StatelessWidget {
  const CustomGNavBar({
    super.key,
    required this.currentIndex,
    this.onChanged,
    required this.tabs,
  });
  final int currentIndex;
  final void Function(int)? onChanged;
  final List<GButton> tabs;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: GNav(
        activeColor: AppColors.kPrimary,
        selectedIndex: currentIndex,
        tabBackgroundColor: Colors.purple.withOpacity(0.1),
        padding: const EdgeInsets.all(16),
        tabBorderRadius: 16,
        gap: 8,
        onTabChange: onChanged,
        tabs: tabs,
      ),
    );
  }
}
