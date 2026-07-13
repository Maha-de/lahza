abstract final class AppEndPoints {

    // Base URL
    static const String baseUrl = "https://projectscopey.onrender.com";

    // Endpoints

    // repair
    static const String issueType = "$baseUrl/repairs/issue-types";
    // reviews
    static const String getAllReviews = "$baseUrl/product-review";

    static const String getProductSpecs = "$baseUrl/products";
    // offers
    static const String getOffers = "$baseUrl/offers/app";
    // my orders
    static const String getMyOrders = "$baseUrl/repairs/me";

    // auth
    static const String auth = "$baseUrl/auth";
    static const String register = "$auth/register";
    static const String login = "$auth/login";
    static const String socialGoogle= "$auth/google";
    static const String completeProfile = "$auth/complete-profile";



    // Keys
    static const String status = "status";
    static const String errorMessage = "ErrorMessage";
    static const String email = "email";
    static const String password = "password";
    static const String token = "token";
    static const String message = "message";
    static const String id = "id";
    static const String name = "name";
    static const String phone = "phone";
    static const String confirmPassword = "confirmPassword";
    static const String location = "location";
    static const String profilePic = "profilePic";

}