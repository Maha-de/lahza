abstract final class AppEndPoints {
  // Base URL
  static const String baseUrl = "https://projectscopey.onrender.com";

  // Endpoints

  // repair
  static const String issueType = "$baseUrl/repairs/issue-types";
  // reviews
  static const String getAllReviews = "$baseUrl/product-review";
  //buy phone
  static const String products = '$baseUrl/products';
  static const String productDetails = '$products/{id}';
  static const String favorites = '$products/favorites';
  static const String toggleFavorite = '$favorites/{id}/toggle';

  // Keys
  static const String status = "success";
  static const String errorMessage = "message";
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
