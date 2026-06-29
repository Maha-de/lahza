import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/buy_phone/phone_details/box_content_model.dart';
import 'package:lahza/features/buy_phone/phone_details/phone_specs_model.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/box_contents_widget.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/phone_colors_widget.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/phone_description_widget.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/phone_header_card.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/phone_pros_cons_widget.dart';
import 'package:lahza/features/buy_phone/phone_details/widgets/phone_specs_widget.dart';

class PhoneDetailsScreen extends StatefulWidget {
  const PhoneDetailsScreen({super.key, this.isFavorite = true});

  final bool isFavorite;
  @override
  State<PhoneDetailsScreen> createState() => _PhoneDetailsScreenState();
}

class _PhoneDetailsScreenState extends State<PhoneDetailsScreen> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.phoneDetails,
        iconLeading: widget.isFavorite ? Icons.favorite : Icons.favorite_border,
        iconColor: widget.isFavorite ? Colors.red : Colors.grey,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Card
            PhoneHeaderCard(
              phoneName: "iPhone 16 Pro Max",
              image: AppAssets.welcomeBanner,
              price: "55,000 جنيه",
              phoneStatus: "جديد",
              phoneCapacity: "256 GB",
              rate: 4.8,
            ),
            SizedBox(height: 20.h),

            /// Color Selector
            PhoneColorsWidget(
              selectedIndex: selectedColor,
              onTap: (index) {
                setState(() {
                  selectedColor = index;
                });
              },
            ),
            SizedBox(height: 16.h),

            PhoneDescriptionWidget(
              description:
                  "يأتي iPhone 16 Pro Max بشاشة Super Retina XDR مقاس 6.9 بوصة مع معالج A18 Pro الذي يوفر أداءً فائقًا للألعاب والتطبيقات الاحترافية، بالإضافة إلى كاميرا متطورة بدقة عالية وبطارية تدوم طوال اليوم.",
            ),

            SizedBox(height: 16.h),

            PhoneSpecsWidget(
              specs: const PhoneSpecsModel(
                screen: "6.1 بوصة",
                processor: "A16 Bionic",
                rearCamera: "48 MP +12MP",
                frontCamera: "12 MP",
                storage: "256 GB",
                ram: "6Gb",
                battery: "3349 mAh",
                operatingSystem: "iOS 17",
              ),
            ),

            SizedBox(height: 16.h),

            Row(
              children: [
                Expanded(
                  child: PhoneProsConsWidget(
                    title: "المميزات",
                    color: Colors.green,
                    icon: Icons.check_circle,
                    items: const [
                      "أداء قوي وسريع بمعالج A16 Bionic",
                      "كاميرا 48MP عالية الجودة",
                      "شاشة OLED ممتازة",
                      "دعم Dynamic Island",
                      "منفذ USB-C",
                    ],
                  ),
                ),

                SizedBox(width: 8.w),

                Expanded(
                  child: PhoneProsConsWidget(
                    title: "العيوب",
                    color: Colors.red,
                    icon: Icons.remove_circle,
                    items: const [
                      "معدل تحديث 60Hz فقط",
                      "لا يدعم التقريب البصري 5x",
                      "سرعة الشحن أقل من المنافسين",
                      "لا يوجد شاحن داخل العلبة",
                      "لا يدعم MicroSD",
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),
            Text(AppStrings.boxContents, style: AppTextStyles.primaryDark15500),
            SizedBox(height: 16.h),

            BoxContentWidget(
              items: const [
                BoxContentModel(title: "الهاتف"),
                BoxContentModel(title: "USB-C"),
                BoxContentModel(title: "دليل الاستخدام"),
                BoxContentModel(title: "بطاقة الضمان"),
              ],
            ),
            SizedBox(height: 16.h),

            ElevatedButton(
              onPressed: () {},
              child:  Text(AppStrings.callMe),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
