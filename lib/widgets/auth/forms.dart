import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/bloc/auth/auth-bloc.dart';
import 'package:heytorus/bloc/auth/auth-events.dart';
import 'package:heytorus/bloc/auth/auth-state.dart';
import 'package:heytorus/models/auth.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class AuthFormPhone extends StatefulWidget {
  const AuthFormPhone({super.key});

  @override
  State<AuthFormPhone> createState() => _AuthFormPhoneState();
}

class _AuthFormPhoneState extends State<AuthFormPhone> {
  final _authFormKey = GlobalKey<FormState>();
  //final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your mobile number to login or register',
          textAlign: TextAlign.left,
          style: styles.sectionTextStyle(),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _authFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onChanged: (value) {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthPhoneFieldChangeEvent(value.toString()),
                  );
                },
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]'),
                  ),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  // contentPadding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  prefixIcon: SizedBox(
                    width: 80,
                    height: 35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/in-flag.svg',
                          width: 35,
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                  focusedBorder: styles.formBorder(isFocused: true),
                  enabledBorder: styles.formBorder(),
                  border: styles.formBorder(),
                  labelText: 'Mobile Number',
                  hintText: 'Mobile Number',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  // print(value);
                  return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthFormPhoneOTP extends StatefulWidget {
  String phone;
  AuthFormPhoneOTP({super.key, required this.phone});

  @override
  State<AuthFormPhoneOTP> createState() => _AuthFormPhoneOTPState();
}

class _AuthFormPhoneOTPState extends State<AuthFormPhoneOTP> {
  final _authFormOTPKey = GlobalKey<FormState>();
  OTP phoneOTP = OTP();

  @override
  void initState() {
    super.initState();
    phoneOTP = OTP();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authFormOTPKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Enter OTP sent on ${widget.phone}',
                textAlign: TextAlign.left,
                style: styles.sectionTextStyle(),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthToggleOTPScreenEvent(false),
                  );
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthPhoneFieldChangeEvent(''),
                  );
                },
                child: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              for (var i = 1; i < 7; i++)
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(),
                  margin: const EdgeInsets.fromLTRB(0, 0, 7, 0),
                  height: utils.vw(11, context),
                  width: utils.vw(11, context),
                  child: TextFormField(
                    // autofocus: true,
                    //focusNode: FocusNode(),
                    onChanged: (value) {
                      switch (i) {
                        case 1:
                          phoneOTP.digit1 = value;
                        case 2:
                          phoneOTP.digit2 = value;
                        case 3:
                          phoneOTP.digit3 = value;
                        case 4:
                          phoneOTP.digit4 = value;
                        case 5:
                          phoneOTP.digit5 = value;
                        case 6:
                          phoneOTP.digit6 = value;
                          break;
                      }

                      if (value.length == 1) {
                        FocusScope.of(context)
                            .focusInDirection(TraversalDirection.right);
                      }

                      if (phoneOTP.getString().length == 6) {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthValidateOTPEvent(
                            valid: true,
                            OTP: phoneOTP.getString(),
                          ),
                        );

                        //context.go('/');
                      } else {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthValidateOTPEvent(valid: false),
                        );
                      }
                    },
                    style: TextStyle(fontSize: utils.vw(4, context)),
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    decoration: styles.formFieldInputDecoration(),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Your OTP is valid for ',
                textAlign: TextAlign.left,
                style: styles.sectionTextStyle(),
              ),
              Countdown(
                seconds: 300,
                build: (BuildContext context, double time) => Text(
                  utils.formatTime(time.toInt()),
                  textAlign: TextAlign.left,
                  style: styles.sectionTextStyle(isBold: true),
                ),
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  //print('Timer is done!');
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthToggleResendOTPEvent(true),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class EmailVerifyForm extends StatefulWidget {
  const EmailVerifyForm({super.key});

  @override
  State<EmailVerifyForm> createState() => _EmailVerifyFormState();
}

class _EmailVerifyFormState extends State<EmailVerifyForm> {
  final _verifyEmailFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _verifyEmailFormKey,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          FormBuilderTextField(
            name: 'email',
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {},
            keyboardType: TextInputType.emailAddress,
            validator: (input) =>
                input?.isValidEmail() == true ? null : 'Invalid Email',
            inputFormatters: const <TextInputFormatter>[],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: styles.formBorder(isFocused: true),
              enabledBorder: styles.formBorder(),
              border: styles.formBorder(),
              labelText: 'Enter email id',
              hintText: 'Enter email id',
            ),
            // The validator receives the text that the user has entered.
          ),
        ],
      ),
    );
  }
}
