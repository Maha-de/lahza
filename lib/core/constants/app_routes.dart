import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lahza/di/di.dart';
import 'package:lahza/features/auth/cubit/login/login_cubit.dart';
import 'package:lahza/features/auth/cubit/signup/signup_cubit.dart';
import 'package:lahza/features/auth/enums/auth_type.dart';
import 'package:lahza/features/auth/view/screens/login_screen.dart';
import 'package:lahza/features/auth/view/screens/signup_screen.dart';
import 'package:lahza/features/auth/view/screens/welcome_screen.dart';
import 'package:lahza/features/auth/view/screens/complete_profile_screen.dart';
import 'package:lahza/features/buy_phone/phone_details/screens/phone_details_screen.dart';
import 'package:lahza/features/buy_phone/screens/buy_phone_screen.dart';
import 'package:lahza/features/customer_service/screens/customer_service.dart';
import 'package:lahza/features/device_info/cubit/device_info_cubit.dart';
import 'package:lahza/features/forget_password/forget_password.dart';
import 'package:lahza/features/forget_password/otp_page.dart';
import 'package:lahza/features/forget_password/reset_password.dart';
import 'package:lahza/features/forget_password/success_screen.dart';
import 'package:lahza/features/issue_types/cubit/issue_type_cubit.dart';
import 'package:lahza/features/issue_types/view/screens/issue_type_screen.dart';
import 'package:lahza/features/main_layout/home/repair/complete_order/assigning_courier_screen.dart';
import 'package:lahza/features/main_layout/home/repair/complete_order/confirm_order_screen.dart';
import 'package:lahza/features/main_layout/home/repair/complete_order/inspection_result_screen.dart';
import 'package:lahza/features/device_info/view/screens/device_details_screen.dart';
import 'package:lahza/features/main_layout/home/repair/device_details/review_request_screen.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/order_time_line/order_time_line_screen.dart';
import 'package:lahza/features/main_layout/home/repair/issue_type/order_tracking_screen.dart';
import 'package:lahza/features/main_layout/main_layout_screen.dart';
import 'package:lahza/features/notifications/screens/notification_screen.dart';
import 'package:lahza/features/onboarding/presentation/screens/onboarding_screens.dart';
import 'package:lahza/features/orders/screens/my_orders.dart';
import 'package:lahza/features/payment/payment_screen.dart';
import 'package:lahza/features/profile/screens/edit_profile.dart';
import 'package:lahza/features/profile/screens/profile_screen.dart';
import 'package:lahza/features/reviews/cubit/product_specs_cubit.dart';
import 'package:lahza/features/reviews/cubit/review_product_details_cubit.dart';
import 'package:lahza/features/reviews/cubit/reviews_cubit.dart';
import 'package:lahza/features/reviews/screens/view/review_phone_details_screen.dart';
import 'package:lahza/features/reviews/screens/view/review_phones_screen.dart';
import 'package:lahza/features/splash/presentation/screens/splash_screen.dart';
import '../../features/Offers/screens/offers_screen.dart';

abstract final class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String welcomeScreen = '/welcomeScreen';
  static const String completeProfile = '/complete-profile';
  static const String otp = '/otp';
  static const String newPassword = '/new-password';
  static const String resetPassword = '/reset-password';
  static const String createNewPassword = '/create-new-password';
  static const String success = '/success';
  // static const String home = '/home';
  static const String mainLayout = '/mainLayout';
  static const String otpPage = '/otp';
  static const issueType = '/issue-Type';
  static const String services = '/services';
  static const String orderDetails = '/order-details';
  static const String orderStatus = '/order-status';
  static const String inspectionResult = '/inspection-result';
  static const String confirmOrder = '/confirm-order';
  static const String assigningCourier = '/assigning-courier';
  static const orderTimeLine = '/orderTimeLine';
  static const orderTracking = '/orderTracking';
  static const String payment = '/payment';
  static const String buyPhone = '/buyPhone';
  static const String phoneDetails = '/phoneDetails';

  static const String offer = '/offer';
  static const String myOrders = '/myOrders';
  static const String notificationScreen = '/notificationScreen';

  static const String editProfile = '/editProfile';
  static const String profileScreen = '/profileScreen';

  static const String favorites = '/favorites';
  static const String customerService = '/customerService';
  static const String reviewPhones = '/reviewPhones';
  static const String phoneDetailsScreen = '/phoneDetailsScreen';
  static const String buyPhoneDetailsScreen = '/buyPhoneDetailsScreen';

  static MaterialPageRoute<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case welcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case buyPhone:
        return MaterialPageRoute(builder: (_) => const BuyPhoneScreen());

      case inspectionResult:
        return MaterialPageRoute(
          builder: (_) => const InspectionResultScreen(),
        );
      case assigningCourier:
        return MaterialPageRoute(
          builder: (_) => const AssigningCourierScreen(),
        );
      case confirmOrder:
        return MaterialPageRoute(builder: (_) => const ConfirmOrderScreen());
      case orderTimeLine:
        return MaterialPageRoute(builder: (_) => const OrderTimeLineScreen());
      case orderStatus:
        return MaterialPageRoute(builder: (_) => const ReviewRequestScreen());

      case AppRoutes.orderTracking:
        return MaterialPageRoute(builder: (_) => const OrderTrackingScreen());
      case orderDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => getIt<DeviceInfoCubit>(),
            child: const DeviceDetailsScreen(),
          ),
        );
      case createNewPassword:
        return MaterialPageRoute(builder: (_) => const ResetPassword());
      case AppRoutes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<RegisterCubit>(),
            child: const SignupScreen(),
          ),
        );
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case success:
        return MaterialPageRoute(builder: (_) => const SuccessScreen());
      case otpPage:
        return MaterialPageRoute(builder: (_) => const OtpPage());
      case resetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case mainLayout:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case issueType:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<IssueTypeCubit>(),
            child: const IssueTypeScreen(),
          ),
        );

      case completeProfile:
        final authType = settings.arguments as AuthType? ?? AuthType.normal;

        return MaterialPageRoute(
          builder: (_) => CompleteProfileScreen(authType: authType),
        );

      case offer:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case myOrders:
        return MaterialPageRoute(builder: (_) => const MyOrdersScreen());
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfile());
      case customerService:
        return MaterialPageRoute(builder: (_) => const CustomerService());

      case reviewPhones:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<PhoneReviewsCubit>(),
            child: const ReviewPhonesScreen(),
          ),
        );

      case profileScreen:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case phoneDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ReviewProductDetailsCubit>(),
              ),
              BlocProvider(create: (context) => getIt<ProductsSpecsCubit>()),
            ],
            child: const ReviewPhoneDetailsScreen(),
          ),
          settings: settings,
        );

      case buyPhoneDetailsScreen:
        return MaterialPageRoute(builder: (_) => const BuyPhoneDetailsScreen());

      default:
        return _undefinedRoute(settings.name);
    }
  }

  static MaterialPageRoute<dynamic> _undefinedRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for $routeName')),
      ),
    );
  }
}
