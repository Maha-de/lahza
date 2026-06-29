import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/features/main_layout/bottom_bar_painter.dart';
import 'package:lahza/features/main_layout/nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const items = [
    (icon: Icons.person_rounded, label: 'حسابي'),
    (icon: Icons.home_rounded, label: 'الرئيسية'),
    (icon: Icons.notifications_rounded, label: 'الإشعارات'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    /// يمين - وسط - شمال
    final positions = [
      width * .83,
      width * .50,
      width * .17,
    ];

    return SizedBox(
      height: 100.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: BottomBarPainter(
                centerX: positions[currentIndex],
              ),
              child: SizedBox(
                height: 70.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Row(
                    children: [
                      Expanded(
                        child: NavItem(
                          icon: items[0].icon,
                          label: items[0].label,
                          isSelected: currentIndex == 0,
                          onTap: () => onTap(0),
                        ),
                      ),
                      Expanded(
                        child: NavItem(
                          icon: items[1].icon,
                          label: items[1].label,
                          isSelected: currentIndex == 1,
                          onTap: () => onTap(1),
                        ),
                      ),
                      Expanded(
                        child: NavItem(
                          icon: items[2].icon,
                          label: items[2].label,
                          isSelected: currentIndex == 2,
                          onTap: () => onTap(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOut,
            top: 12.h,
            left: positions[currentIndex] - 30.w,
            child: GestureDetector(
              onTap: () => onTap(currentIndex),
              child: Container(
                width: 60.w,
                height: 60.w,
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
                  size: 28.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}