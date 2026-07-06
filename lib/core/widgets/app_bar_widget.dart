import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? style;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? leadingColor;
  final IconData? icon;
  final IconData? iconLeading;
  final double height;
  final VoidCallback? onLeadingPressed;
  final List<PopupMenuEntry<String>>? menuItems;
  final PopupMenuItemSelected<String>? onMenuSelected;

  const AppBarWidget({
    super.key,
    this.style,
    this.title,
    this.backgroundColor,
    this.iconColor,
    this.leadingColor,
    this.iconLeading,
    this.icon,
    this.height = kToolbarHeight,
    this.onLeadingPressed,
    this.menuItems,
    this.onMenuSelected,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            icon ?? Icons.arrow_forward,
            color: leadingColor ?? AppColors.primary,
          ),
        ),
      ],
      title: Text(title ?? '', style: style),
      // leading: Icon(iconLeading, color: iconColor ?? AppColors.primary),

      leading: iconLeading == null
          ? null
          : menuItems != null
          ? PopupMenuButton<String>(
        color: Colors.white,
        icon: Icon(
          iconLeading,
          color: iconColor ?? AppColors.primary,
        ),
        onSelected: onMenuSelected,
        itemBuilder: (context) => menuItems!,
      )
          : onLeadingPressed != null
          ? IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(
          iconLeading,
          color: iconColor ?? AppColors.primary,
        ),
      )
          : Icon(
        iconLeading,
        color: iconColor ?? AppColors.primary,
      ),

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
