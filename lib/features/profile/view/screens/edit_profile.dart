import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/constants/app_strings.dart';
import 'package:lahza/core/constants/app_validation.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/profile/cubit/profile_cubit.dart';
import 'package:lahza/features/profile/cubit/profile_state.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<ProfileCubit>();

        if (cubit.state is ProfileSuccess) {
          final profile = (cubit.state as ProfileSuccess).profileModel;

          nameController.text = profile.data.fullName ?? '';
          phoneController.text = profile.data.phone ?? '';
        }
    context.read<ProfileCubit>().fetchMyProfile();
    // nameController.text = state.profileModel.data.fullName ?? "";
    // phoneController.text = state.profileModel.data.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        switch (state) {
          case ProfileLoading _:
            return const Center(child: CircularProgressIndicator());

          case ProfileError _:
            return Center(child: Text(state.errorModel.errorMessage));

          case ProfileSuccess _:
            final displayList = state.profileModel;
            // nameController.text = state.profileModel.data.fullName ?? "";
            // phoneController.text = state.profileModel.data.phone ?? "";
            // passwordController.text = state.profileModel.data.password ?? "";

            return Scaffold(
              appBar: AppBarWidget(
                title: AppStrings.editProfile,
                iconLeading: Icons.check,
                onLeadingPressed: () {
                  // context
                  //     .read<ProfileCubit>()
                  //     .updateProfile(
                  //
                  //   context
                  //       .read<ProfileCubit>()
                  //       .nameController
                  //       .text,
                  //   context
                  //       .read<ProfileCubit>()
                  //       .phoneController
                  //       .text,
                  //   context
                  //       .read<ProfileCubit>()
                  //       .passwordController
                  //       .text,
                  // );
                  print("DEBUG: Name is: ${nameController.text}");
                  print("DEBUG: Phone is: ${phoneController.text}");

                  final updateName = nameController.text;
                  final updatePhone = phoneController.text;
                  final updatePassword = passwordController.text;

                  context.read<ProfileCubit>().updateProfile(updateName, updatePhone,updatePassword);
                },
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Form(
                      key: _formKey,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(

                            onTap: () async {
                              try {
                                final pickedImage = await ImagePicker()
                                    .pickImage(
                                  source: ImageSource.gallery,
                                );

                                if (pickedImage == null) {
                                  // User canceled
                                  return;
                                }

                                context
                                    .read<ProfileCubit>()
                                    .updateProfileImage(pickedImage);
                              } catch (e) {
                                // Optionally show an error message to the user
                                debugPrint('Image pick failed: $e');
                              }
                            },
                            child:

                            CachedNetworkImage(
                              height: 150.h,
                              width: 150.w,
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
                          ),
                          SizedBox(height: 14.h),

                          Text(
                            AppStrings.fullName,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            controller: nameController,
                            validator: AppValidations.validateUserName,
                            decoration: InputDecoration(
                              hintText: displayList.data.fullName,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Password
                          Text(
                            AppStrings.password,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            controller: passwordController,
                            obscureText: obscureText,
                            validator: AppValidations.validatePassword,
                            decoration: InputDecoration(
                              hintText: AppStrings.passwordHint,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Confirm Password
                          Text(
                            AppStrings.confirmPassword,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.visiblePassword,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            controller: confirmPasswordController,
                            obscureText: obscureText,
                            validator: AppValidations.validatePassword,
                            decoration: InputDecoration(
                              hintText: AppStrings.passwordHint,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: Icon(
                                  obscureText
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 14.h),

                          /// Phone Number
                          Text(
                            AppStrings.phoneNumber,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                          SizedBox(height: 8.h),

                          TextFormField(
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validator: AppValidations.validatePhoneNumber,
                            decoration: InputDecoration(
                              hintText: displayList.data.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          case ProfileInitial _:
            return const SizedBox();
        }
      },
    );
  }
}
