import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lahza/core/constants/app_assets.dart';
import 'package:lahza/core/constants/app_routes.dart';
import 'package:lahza/features/splash/cubit/splash_cubit.dart';
import 'package:lahza/features/splash/cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> scaleAnimation;
  late final Animation<double> fadeAnimation;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: .2,
          end: 1.12,
        ).chain(
          CurveTween(curve: Curves.easeOutCubic),
        ),
        weight: 80,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.12,
          end: 1,
        ).chain(
          CurveTween(curve: Curves.easeOut),
        ),
        weight: 20,
      ),
    ]).animate(controller);

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          .35,
          curve: Curves.easeOut,
        ),
      ),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, .35),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic,
      ),
    );

    controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().checkUser();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state) {
          case SplashGoToOnBoarding():
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.onboarding,
            );
            break;

          case SplashGoToLogin():
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.login,
            );
            break;

          case SplashGoToPayment():
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.payment,
            );
            break;

          case SplashGoToPending():
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.subscriptionPending,
            );
            break;

          case SplashGoToHome():
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.mainLayout,
            );
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: FadeTransition(
            opacity: fadeAnimation,
            child: SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: Image.asset(
                  AppAssets.logo,
                  width: .65.sw,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}