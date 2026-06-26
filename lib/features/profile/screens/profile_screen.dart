import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(title: AppStrings.profile,
        ),
        );
  }
}
