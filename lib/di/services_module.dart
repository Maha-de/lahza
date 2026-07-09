import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/core/services/facebook_auth_service.dart';

@module
abstract class ServicesModule {
  @lazySingleton
  GoogleSignIn googleSignIn() => GoogleSignIn(scopes: ['email']);
    @lazySingleton
  FacebookAuthService facebookAuthService() => FacebookAuthService();
}
