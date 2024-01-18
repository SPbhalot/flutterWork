abstract class AuthEvents {}

class AuthSignInEvent extends AuthEvents {
  AuthSignInEvent();
}

class AuthVerifyEvent extends AuthEvents {
  int entityId;
  String? OTP;
  String phone;
  AuthVerifyEvent({
    required this.entityId,
    this.OTP,
    required this.phone,
  });
}

class AuthToggleOTPScreenEvent extends AuthEvents {
  bool showOTPScreen;
  AuthToggleOTPScreenEvent(this.showOTPScreen);
}

class AuthToggleResendOTPEvent extends AuthEvents {
  bool resendOTP;
  AuthToggleResendOTPEvent(this.resendOTP);
}

class AuthValidateOTPEvent extends AuthEvents {
  bool valid;
  String? OTP;
  AuthValidateOTPEvent({
    required this.valid,
    this.OTP,
  });
}

class AuthPhoneFieldChangeEvent extends AuthEvents {
  String phone;
  AuthPhoneFieldChangeEvent(this.phone);
}

class MainAuthEvent extends AuthEvents {
  late bool isLogeedIn;
  late String token;
  MainAuthEvent({required this.isLogeedIn, required this.token});
}
