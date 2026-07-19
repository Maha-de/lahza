sealed class FcmTokenState {}

final class FcmTokenInitial extends FcmTokenState {}
final class FcmTokenLoading extends FcmTokenState {}
final class FcmTokenSuccess extends FcmTokenState {}
final class FcmTokenError extends FcmTokenState {
  final String error;
  FcmTokenError(this.error);
}