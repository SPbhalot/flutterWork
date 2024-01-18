import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/auth/auth-bloc.dart';
import 'package:heytorus/bloc/auth/auth-state.dart';
import 'package:heytorus/layouts/onboarding.dart';
import 'package:heytorus/widgets/auth/forms.dart';
import 'package:heytorus/widgets/master.dart';
import '../../utils/utils.dart' as utils;
import '../../styles/styles.dart' as styles;

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  @override
  Widget build(BuildContext context) {
    return OBLayout(
      bgColor: const Color(0xfffafafa),
      widget: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: utils.vh(3, context),
                    ),
                    Text(
                      'Enter email address',
                      style: TextStyle(
                        fontSize: utils.vw(
                          5,
                          context,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'You will receive OTP on your email',
                      textAlign: TextAlign.left,
                      style: styles.sectionTextStyle(),
                    ),
                    BlocConsumer<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return const EmailVerifyForm();
                      },
                      listener: (context, state) => {},
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                utils.vw(2, context),
              ),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) => {},
                builder: (context, state) {
                  if (authPageState.isOtpScreen == true) {
                    return Row(
                      children: [
                        Expanded(
                          child: IntroButtonAlt(
                            isDisabled:
                                authPageState.resendOTP == false ? true : false,
                            callback: () {},
                            label: 'Resend',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: IntroButtonAlt(
                            isDisabled:
                                authPageState.isOTPValid == true ? false : true,
                            callback: () {
                              // print('Boom Login');
                            },
                            label: 'Verify',
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            const Expanded(
                              child: Text(
                                'I understand and authorize Xperia services to contact me via SMS, calls and whatsapp for all future communication',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        IntroButtonAlt(
                          isDisabled: false,
                          callback: () {},
                          label: 'Validate Email',
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
