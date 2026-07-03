import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/reviews/cubit/reviews_cubit.dart';
import 'package:lahza/features/reviews/cubit/reviews_state.dart';
import 'package:lahza/features/reviews/screens/widgets/review_phones_card.dart';
import 'package:lahza/features/reviews/screens/widgets/search_widget.dart';
import '../../models/review_phones_model.dart';

class ReviewPhonesScreen extends StatefulWidget {
  const ReviewPhonesScreen({super.key});

  @override
  State<ReviewPhonesScreen> createState() => _ReviewPhonesScreenState();
}

class _ReviewPhonesScreenState extends State<ReviewPhonesScreen> {
  List<Data> searchResult = []; // قائمة للبحث
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    // استدعاء البيانات بمجرد بناء الصفحة
    context.read<PhoneReviewsCubit>().fetchReviews();
  }

  void onSearch(List<Data> result, bool searching) {
    setState(() {
      searchResult = result;
      isSearching = searching;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AppStrings.reviewPhones),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: BlocBuilder<PhoneReviewsCubit, ReviewsState>(
          builder: (context, state) {
            // التعامل مع الحالات المختلفة
            switch (state) {
              case ReviewsLoading _:
                return const Center(child: CircularProgressIndicator());

              case ReviewsError _:
                return Center(child: Text(state.errorModel.errorMessage));

              case ReviewsSuccess _:
              // البيانات التي نستخدمها في العرض
                final displayList = isSearching ? searchResult : state.data;
                // isSearching
                // //                       ? searchResult[index]
                // //                       : ReviewPhonesItem.items[index];

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // نمرر الـ state.data للبحث
                      SearchWidget(phones: state.data, onSearch: onSearch),
                      Text("أشهر الهواتف", style: AppTextStyles.primaryDark18500),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: displayList.length,
                        separatorBuilder: (_, __) => SizedBox(height: 12.h),
                        itemBuilder: (context, index) {
                          return ReviewPhonesCard(
                            item: displayList[index], // تمرير العنصر الديناميكي
                            titleStyle: AppTextStyles.primaryDark14500,
                            subtitleStyle: AppTextStyles.gray14500,
                          );
                        },
                      ),
                      SizedBox(height: 15.h),
                      // زر عرض المزيد (يمكنك إضافة منطق Pagination هنا لاحقاً)
                      _buildLoadMoreButton(),
                    ],
                  ),
                );

              case ReviewsInitial _:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadMoreButton() {
    return SizedBox(
      height: 35.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // استدعاء جديد لجلب المزيد
          context.read<PhoneReviewsCubit>().fetchReviews();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("عرض المزيد", style: AppTextStyles.primaryDark14500),
            SizedBox(width: 10.w),
            const Icon(Icons.keyboard_arrow_down_sharp, color: AppColors.primaryDark),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lahza/core/constants/app_colors.dart';
// import 'package:lahza/core/constants/app_strings.dart';
// import 'package:lahza/core/constants/app_text_styles.dart';
// import 'package:lahza/core/widgets/app_bar_widget.dart';
// import 'package:lahza/features/reviews/widgets/review_phones_card.dart';
// import 'package:lahza/features/reviews/widgets/review_phones_item.dart';
// import 'package:lahza/features/reviews/widgets/search_widget.dart';
//
// class ReviewPhonesScreen extends StatefulWidget {
//   const ReviewPhonesScreen({super.key});
//
//   @override
//   State<ReviewPhonesScreen> createState() => _ReviewPhonesScreenState();
// }
//
// class _ReviewPhonesScreenState extends State<ReviewPhonesScreen> {
//   List<ReviewPhonesItem> searchResult = [];
//
//   bool isSearching = false;
//
//   void onSearch(List<ReviewPhonesItem> result, bool searching) {
//     setState(() {
//       searchResult = result;
//       isSearching = searching;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarWidget(title: AppStrings.reviewPhones),
//       body: Padding(
//         padding: EdgeInsets.all(16.r),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SearchWidget(phones: ReviewPhonesItem.items, onSearch: onSearch),
//               Text("أشهر الهواتف", style: AppTextStyles.primaryDark18500),
//               SizedBox(height: 20.h),
//
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//
//                 itemCount: isSearching
//                     ? searchResult.length
//                     : ReviewPhonesItem.items.length,
//
//                 separatorBuilder: (_, __) => SizedBox(height: 12.h),
//
//                 itemBuilder: (context, index) {
//                   final item = isSearching
//                       ? searchResult[index]
//                       : ReviewPhonesItem.items[index];
//
//                   return ReviewPhonesCard(
//                     item: item,
//
//                     titleStyle: AppTextStyles.primaryDark14500,
//
//                     subtitleStyle: AppTextStyles.gray14500,
//                   );
//                 },
//               ),
//               SizedBox(height: 15.h,),
//
//               SizedBox(
//                 height: 35.h,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(80.w, 25.h),
//                     backgroundColor: AppColors.white,
//                     elevation: 0,
//                     padding: EdgeInsets.all(5),
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(color: AppColors.primary, width: 1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//
//                   onPressed: () {},
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "عرض المزيد",
//                         style: AppTextStyles.primaryDark14500,
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 1,
//                       ),
//                       SizedBox(width: 10.w),
//                       Icon(
//                         Icons.keyboard_arrow_down_sharp,
//                         size: 25,
//                         color: AppColors.primaryDark,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 15.h,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
