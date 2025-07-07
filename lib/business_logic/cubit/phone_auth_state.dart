part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}
// progress indicator
final class Loading extends PhoneAuthState {}

// error (firebase - wrong otp - user problem)
final class ErrorOccurred extends PhoneAuthState {
  final String errorMsg;
  ErrorOccurred({required this.errorMsg});
}

// when user entered his phoneNumber
final class PhoneNumberSubmitted extends PhoneAuthState {}

// when user entered otp when msg received in phone 
final class PhoneOTPVerified extends PhoneAuthState {}
