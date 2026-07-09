import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookAuthService {
  Future<LoginResult> signIn() async {
    return await FacebookAuth.instance.login(
      permissions: [
        'email',
        'public_profile',
      ],
    );
  }

  Future<Map<String, dynamic>> getUserData() async {
    return await FacebookAuth.instance.getUserData(
      fields: "id,name,email,picture.width(200)",
    );
  }

  Future<void> signOut() async {
    await FacebookAuth.instance.logOut();
  }
}