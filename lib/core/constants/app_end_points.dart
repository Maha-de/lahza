abstract final class AppEndPoints {

    // Base URL
    static const String baseUrl = "https://projectscopey.onrender.com";

    // Endpoints

    // repair
    static const String issueType = "$baseUrl/repairs/issue-types";
    static const String creatRepair = "$baseUrl/repairs";
    // reviews
    static const String getAllReviews = "$baseUrl/product-review";
    static const String getProductSpecs = "$baseUrl/products";
    //auth
        static const String auth = "$baseUrl/auth";
        static const String register = "$auth/register";
        static const String login = "$auth/login";
        static const String refreshToken = "$auth/refresh-token";
        static const String forgotPassword = "$auth/forgot-password";
        static const String verifyResetOtp = "$auth/verify-reset-otp";
        static const String resetPassword = "$auth/reset-password";
        static const String completeProfile = "$auth/complete-profile";
        static const String subscriptions = "$baseUrl/subscriptions";
        static const String subscriptionMe = "$baseUrl/subscriptions/me";



    // Keys
    static const String status = "success";
    static const String errorMessage = "message";
    static const String email = "email";
    static const String password = "password";
    static const String message = "message";
    static const String id = "id";
    static const String name = "name";
    static const String phone = "phone";
    static const String confirmPassword = "confirmPassword";
    static const String location = "location";
    static const String profilePic = "profilePic";

}