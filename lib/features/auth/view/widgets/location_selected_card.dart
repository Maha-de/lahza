import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lahza/core/constants/app_colors.dart';

class LocationSelectorCard extends StatelessWidget {
  final LatLng? location;
  final VoidCallback onTap;

  const LocationSelectorCard({
    super.key,
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          color: AppColors.grayLight.withOpacity(.2),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.grayLight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_rounded, size: 55.sp, color: AppColors.primary),
            SizedBox(height: 12.h),
            Text(
              location == null
                  ? "تحديد الموقع على الخريطة"
                  : "تم تحديد الموقع ✓",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 6.h),
            Text(
              "اضغط لاختيار موقعك",
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
