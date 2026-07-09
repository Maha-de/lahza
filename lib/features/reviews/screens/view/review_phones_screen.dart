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
  List<Data> searchResult = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
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
            switch (state) {
              case ReviewsLoading _:
                return const Center(child: CircularProgressIndicator());

              case ReviewsError _:
                return Center(child: Text(state.errorModel.errorMessage));

              case ReviewsSuccess _:
                final displayList = isSearching ? searchResult : state.data;

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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

