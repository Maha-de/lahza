import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_text_styles.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/profile/cubit/profile_cubit.dart';
import 'package:lahza/features/profile/cubit/profile_state.dart';
import 'package:lahza/features/profile/view/widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().fetchMyProfile();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBarWidget(title: AppStrings.profile),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          switch (state) {
            case ProfileLoading _:
              return const Center(child: CircularProgressIndicator());

            case ProfileError _:
              return Center(child: Text(state.errorModel.errorMessage));

            case ProfileSuccess _:
              final displayList = state.profileModel;
              return ListView(
                padding: EdgeInsets.all(16.r),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        // height: 120.h,
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.white90.withValues(alpha: 0.12),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.start,

                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: CachedNetworkImage(
                                height: 100.h,
                                width: 100.w,
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                // fit: BoxFit.cover,
                                imageUrl: displayList.data.avatar ?? "",
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(), // أثناء التحميل
                                errorWidget: (context, url, error) => Icon(
                                  Icons.person, color: AppColors.primary,
                                ), // إذا فشل التحميل أو كانت فارغة
                              ),
                              onTap: () {},
                            ),
                            SizedBox(width: 20.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  displayList.data.fullName ?? "",
                                  style: AppTextStyles.primaryDark16500,
                                ),
                                SizedBox(height: 5.h),

                                Text(
                                  displayList.data.phone ?? "",
                                  style: AppTextStyles.gray9500,
                                ),
                                SizedBox(height: 5.h),

                                Container(
                                  width: 140.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.r),
                                    color: AppColors.bannerBackground,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.pushNamed(
                                        context,
                                        AppRoutes.editProfile,
                                      );
                                      if (mounted) {
                                        context.read<ProfileCubit>().fetchMyProfile();
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppStrings.editProfile,
                                          style: AppTextStyles.primary12400,
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: AppColors.primary,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 12.h),
                        itemCount: ProfileItem.items.length,

                        itemBuilder: (context, index) {
                          final item = ProfileItem.items[index];

                          return Container(
                            decoration: BoxDecoration(
                              // color: AppColors.white,
                              // borderRadius: BorderRadius.circular(18.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.white90.withValues(
                                    alpha: 0.12,
                                  ),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Material(
                              // color: AppColors.white,
                              borderRadius: BorderRadius.circular(18.r),
                              child: ListTile(
                                tileColor: AppColors.white,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 6.h,
                                ),
                                leading: Icon(
                                  item.icon,
                                  color: AppColors.primary,
                                ),
                                title: Text(
                                  item.label,
                                  style: AppTextStyles.primaryDark14500,
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: AppColors.primary,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, item.route!);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.h),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.red, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: () {},
                        icon: const Icon(Icons.exit_to_app),
                        label: const Text("تسجيل خروج"),
                      ),
                      SizedBox(height: 20.h),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.red, // لون البوردر
                              width: 1, // سمك البوردر
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                        label: const Text("حذف الحساب"),
                      ),
                    ],
                  ),
                ],
              );
            case ProfileInitial _:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
