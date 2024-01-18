import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/auth/auth-events.dart';
import 'package:heytorus/bloc/auth/auth-state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(MainAuthState()) {
    on<AuthSignInEvent>((event, emit) {});
    on<AuthToggleOTPScreenEvent>((event, emit) {
      authPageState.isOtpScreen = event.showOTPScreen;
      //print(emit);
      emit(AuthPageState());
    });

    on<AuthPhoneFieldChangeEvent>((event, emit) {
      authPageState.phone = event.phone;
      //print(emit);
      emit(AuthPageState());
    });

    on<AuthValidateOTPEvent>((event, emit) {
      authPageState.isOTPValid = event.valid;
      if (event.OTP != null) {
        authPageState.otp = event.OTP!;
      }

      // authPageState.o
      emit(AuthPageState());
    });

    on<AuthToggleResendOTPEvent>((event, emit) {
      authPageState.resendOTP = event.resendOTP;
      //print(emit);
      emit(AuthPageState());
    });

    on<MainAuthEvent>((event, emit) {
      // authVerifyState.entityId = event.entityId;
      // authVerifyState.phone = event.phone;

      mainAuthState.isLogeedIn = event.isLogeedIn;
      mainAuthState.token = event.token;
      emit(AuthVerifyState());
      emit(MainAuthState());
    });

    on<AuthVerifyEvent>((event, emit) {
      authVerifyState.entityId = event.entityId;
      authVerifyState.phone = event.phone;

      emit(AuthVerifyState());
    });
  }
}
