import 'package:flutter/material.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.favirote,),
    );
  }
}