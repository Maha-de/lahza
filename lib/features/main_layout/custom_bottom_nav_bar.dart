import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/features/main_layout/bottom_bar_painter.dart';
import 'package:lahza/features/main_layout/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const items = [
    (icon: Icons.home_rounded, label: 'الرئيسية'),
    (icon: Icons.person_rounded, label: 'حسابي'),
    (icon: Icons.notifications_rounded, label: 'الإشعارات'),
  ];

  @override
  Widget build(BuildContext context) {
    final sideItems = List.generate(
      items.length,
          (index) => index,
    ).where((e) => e != currentIndex).toList();

    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: BottomBarPainter(),
              child: SizedBox(
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: NavItem(
                          icon: items[sideItems[0]].icon,
                          label: items[sideItems[0]].label,
                          onTap: () => onTap(sideItems[0]),
                        ),
                      ),

                      const SizedBox(width: 90),

                      Expanded(
                        child: NavItem(
                          icon: items[sideItems[1]].icon,
                          label: items[sideItems[1]].label,
                          onTap: () => onTap(sideItems[1]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 12.h,
            child: GestureDetector(
              onTap: () => onTap(currentIndex),
              child: Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .15),
                      blurRadius: 12,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(
                  items[currentIndex].icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
