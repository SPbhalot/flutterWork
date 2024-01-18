abstract class AuthState {}

class MainAuthState extends AuthState {
  bool isLogeedIn = false;
  String token = '';
  MainAuthState();
}

class AuthVerifyState extends AuthState {
  late int entityId;
  late String OTP;
  late String phone;
  AuthVerifyState();
}

class AuthPageState extends AuthState {
  bool isOtpScreen = false;
  bool isOTPValid = false;
  bool phoneValid = false;
  bool resendOTP = false;
  String otp = '';
  String phone = '';
  AuthPageState();
}

class EmailPageState {
  bool isOtpScreen = false;
  bool isOTPValid = false;
  bool emailValid = false;
  bool resendOTP = false;
  String email = '';
  String otp = '';

  EmailPageState();
}

AuthPageState authPageState = AuthPageState();
MainAuthState mainAuthState = MainAuthState();
AuthVerifyState authVerifyState = AuthVerifyState();
