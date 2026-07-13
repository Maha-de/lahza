import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:lahza/features/auth/models/responses/google_auth/google_auth_model.dart';

@lazySingleton
class GoogleAuthService {
  final GoogleSignIn _googleSignIn;

  GoogleAuthService(this._googleSignIn);

  Future<GoogleAuthModel?> signIn() async {
    final account = await _googleSignIn.signIn();

    if (account == null) return null;

    final auth = await account.authentication;

    return GoogleAuthModel(
      idToken: auth.idToken ?? '',
      accessToken: auth.accessToken,
      email: account.email,
      name: account.displayName ?? '',
      image: account.photoUrl,
    );
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}