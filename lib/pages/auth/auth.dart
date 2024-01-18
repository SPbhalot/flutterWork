import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/bloc/auth/auth-bloc.dart';
import 'package:heytorus/bloc/auth/auth-events.dart';
import 'package:heytorus/bloc/auth/auth-state.dart';
import 'package:heytorus/bloc/master/master-bloc.dart';
import 'package:heytorus/bloc/master/master-events.dart';
import 'package:heytorus/layouts/onboarding.dart';
import 'package:heytorus/services/auth-service.dart';
import 'package:heytorus/widgets/auth/forms.dart';
import 'package:heytorus/widgets/master.dart';
import '../../utils/utils.dart' as utils;

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return OBLayout(
      bgColor: const Color(0xfffafafa),
      widget: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                //color: Colors.pink,
                child: Stack(
                  children: [
                    Positioned(
                      top: utils.vh(27, context),
                      left: utils.vw(0, context),
                      child: SvgPicture.asset(
                        'assets/icons/welcome-logo.svg',
                        width: utils.vw(
                          25,
                          context,
                        ),
                      ),
                    ),
                    SizedBox(
                      //color: Colors.pink,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: utils.vh(3, context),
                          ),
                          Text(
                            'Welcome to Torus',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: utils.vw(6, context),
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff3F7ED3),
                            ),
                          ),
                          SizedBox(
                            height: utils.vh(4, context),
                          ),
                          Text(
                            'Let\'s get started!',
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
                          BlocConsumer<AuthBloc, AuthState>(
                            builder: (context, state) {
                              if (authPageState.isOtpScreen == true) {
                                return AuthFormPhoneOTP(
                                  phone: authPageState.phone,
                                );
                              } else {
                                return const AuthFormPhone();
                              }
                            },
                            listener: (context, state) => {},
                          )
                        ],
                      ),
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
                            callback: () {
                              BlocProvider.of<AuthBloc>(context).add(
                                AuthToggleOTPScreenEvent(true),
                              );
                            },
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
                            callback: () async {
                              try {
                                BlocProvider.of<MasterBloc>(context).add(
                                  ToggleLoadingEvent(true),
                                );
                                print(authPageState.otp);
                                Map aV = await auth.verifyOTP(
                                  entityId: authVerifyState.entityId,
                                  phone: authVerifyState.phone,
                                  OTP: authPageState.otp,
                                );

                                BlocProvider.of<AuthBloc>(context).add(
                                  MainAuthEvent(
                                    isLogeedIn: true,
                                    token: aV['jwt'],
                                  ),
                                );

                                context.go('/');

                                //  print(aV);

                                BlocProvider.of<MasterBloc>(context).add(
                                  ToggleLoadingEvent(false),
                                );
                              } catch (e) {
                                print(e);
                                BlocProvider.of<MasterBloc>(context).add(
                                  ToggleLoadingEvent(false),
                                );
                              }

                              // print('Boom Login');
                            },
                            label: 'Verify',
                          ),
                        ),
                      ],
                    );
                  } else {
                    return IntroButtonAlt(
                      isDisabled:
                          authPageState.phone.length != 10 ? true : false,
                      callback: () async {
                        try {
                          BlocProvider.of<MasterBloc>(context).add(
                            ToggleLoadingEvent(true),
                          );
                          Map lPromise = await auth.loginOrRegisterWithPhone(
                            phone: '+91${authPageState.phone}',
                          );

                          BlocProvider.of<AuthBloc>(context).add(
                            AuthToggleOTPScreenEvent(true),
                          );

                          //print(lPromise);
                          BlocProvider.of<AuthBloc>(context).add(
                            AuthVerifyEvent(
                              entityId: lPromise['id'],
                              phone: '+91${authPageState.phone}',
                            ),
                          );

                          // BlocProvider.of<AuthBloc>(context).add(
                          //   AuthToggleResendOTPEvent(false),verify
                          // );
                          BlocProvider.of<MasterBloc>(context).add(
                            ToggleLoadingEvent(false),
                          );
                        } catch (e) {
                          BlocProvider.of<MasterBloc>(context).add(
                            ToggleLoadingEvent(false),
                          );
                        }
                      },
                      label: 'Get OTP',
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
