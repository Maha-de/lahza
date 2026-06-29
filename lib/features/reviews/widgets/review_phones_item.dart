
import 'package:flutter/material.dart';


class ReviewPhonesItem {
  final Image image;
  final String title;
  final String? subtitle;
  final String? rate;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const ReviewPhonesItem({
    required this.image,
    required this.title,
    this.rate,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  static final items = [
    ReviewPhonesItem(
      image: Image.asset("assets/images/iphone17.png"),
      title: "Iphone 17 Pro Max",
      subtitle: "هاتف رائد بأداء وكاميرات احترافية",

    ),
    ReviewPhonesItem(
      image: Image.asset("assets/images/s24_ultra.png"),
      title: "Samsung Galaxy S24 Ultra",
      subtitle: "هاتف رائد للتصوير والانتاجية",

    ),

    ReviewPhonesItem(
      image: Image.asset("assets/images/iphone15.png"),
      title: "Iphone 15",
      subtitle: "اداء احترافي وتجربة استخدام متميزة",

    ),
    ReviewPhonesItem(
      image: Image.asset("assets/images/oppo_reno.png"),
      title: "Oppo Reno 14 Pro",
      subtitle: "تصميم عصري ومواصفات متوازنة",

    ),
    ReviewPhonesItem(
      image: Image.asset("assets/images/oppo_a5.png"),
      title: "Oppo A5",
      subtitle: "تصميم عصري ومواصفات متوازنة",

    ),


  ];
}
