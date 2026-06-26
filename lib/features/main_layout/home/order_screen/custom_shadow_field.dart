import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShadowTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final int maxLines;
  final int? maxLength;
  final double? height;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const CustomShadowTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.height,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines,
        maxLength: maxLength,
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hintText,

          contentPadding: EdgeInsets.only(
            right: 16.w,
            left: 16.w,
            top: 16.h,
            bottom: 16.h,
          ),

          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),

        buildCounter: (
          context, {
          required int currentLength,
          required bool isFocused,
          required int? maxLength,
        }) {
          if (maxLength == null) return null;

          return Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              bottom: 12.h,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$currentLength/$maxLength',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}