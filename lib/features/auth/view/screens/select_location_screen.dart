import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lahza/core/constants/app_colors.dart';
import 'package:lahza/core/widgets/app_bar_widget.dart';
import 'package:lahza/features/auth/cubit/complete_profile/complete_profile_cubit.dart';
import 'package:lahza/features/auth/cubit/complete_profile/complete_profile_state.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  late final CompleteProfileCubit cubit;

  LatLng? selectedLocation;

  @override
  void initState() {
    super.initState();

    cubit = context.read<CompleteProfileCubit>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (cubit.state.selectedLocation == null) {
        await cubit.getCurrentLocation();
      }

      selectedLocation = cubit.state.selectedLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        final location =
            state.selectedLocation ?? const LatLng(30.0444, 31.2357);

        return Scaffold(
          appBar: const AppBarWidget(
            title: 'تحديد الموقع',
          ),
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 16,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
                compassEnabled: true,
                buildingsEnabled: true,
                rotateGesturesEnabled: true,
                tiltGesturesEnabled: true,
                onMapCreated: (controller) {
                  cubit.mapController = controller;
                },

                onCameraMove: (cameraPosition) {
                  selectedLocation = cameraPosition.target;
                },

                onCameraIdle: () {
                  if (selectedLocation != null) {
                    cubit.changeLocation(selectedLocation!);
                  }
                },
              ),

              IgnorePointer(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 35.h),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50.sp,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 16.w,
                bottom: 95.h,
                child: FloatingActionButton(
                  heroTag: 'myLocation',
                  backgroundColor: Colors.white,
                  elevation: 3,
                  onPressed: () async {
                    await cubit.getCurrentLocation();

                    if (cubit.state.selectedLocation != null) {
                      cubit.mapController?.animateCamera(
                        CameraUpdate.newLatLngZoom(
                          cubit.state.selectedLocation!,
                          16,
                        ),
                      );
                    }
                  },
                  child: const Icon(
                    Icons.my_location,
                    color: AppColors.primary,
                  ),
                ),
              ),

              Positioned(
                right: 16.w,
                left: 16.w,
                bottom: 20.h,
                child: SizedBox(
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedLocation != null) {
                        cubit.changeLocation(selectedLocation!);
                      }

                      Navigator.pop(context);
                    },
                    child: const Text("تأكيد الموقع"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}