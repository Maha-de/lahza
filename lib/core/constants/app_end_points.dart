abstract final class AppEndPoints {
  // Base URL
  static const String baseUrl =
      "https://scopeybackend-omaimasayedmohamed2022.onrender.com";

  // Endpoints

  // repair
  static const String issueType = "$baseUrl/repairs/issue-types";
  static const String creatRepair = "$baseUrl/repairs";
  static const String getRepairById = "$baseUrl/repairs/me/{id}";
  static const String confirmRepair = "$baseUrl/repairs/me/{id}/confirm";
  static const String trackRepair = "$baseUrl/repairs/{id}/track";
  static const String updateRepairStatus = "$baseUrl/repairs/{id}/status";

  // reviews
  static const String getAllReviews = "$baseUrl/product-review";
  static const String getProductSpecs = "$baseUrl/products";

  // offers
  static const String getOffers = "$baseUrl/offers/app";

  // my orders
  static const String getMyOrders = "$baseUrl/repairs/me";

  // notifications
  static const String getNotifications = "$baseUrl/notifications";
  static const String readAllNotifications = "$baseUrl/notifications/read-all";
  static const String readNotifications = "$baseUrl/notifications/{id}/read";

  // profile
  static const String getProfile = "$baseUrl/users/profile";
  static const String updateImageProfile = "$baseUrl/users/avatar";

  // chat
  static const String sendMessage = "$baseUrl/chat/message";
  static const String createChat = "$baseUrl/chat";
  static const String getMessages = "$baseUrl/chat/messages";

  //auth
  static const String auth = "$baseUrl/auth";
  static const String register = "$auth/register";
  static const String login = "$auth/login";
  static const String socialGoogle = "$auth/google";
  static const String completeProfile = "$auth/complete-profile";

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
