import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heytorus/bloc/auth/auth-bloc.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/kyc/steps.dart';
import 'package:m7_livelyness_detection/m7_livelyness_detection.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class SelfieVerificationStep extends StatelessWidget {
  const SelfieVerificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    // M7Live m7 = M7Live();
    return BlocConsumer<UserBloc, UserState>(
      builder: (context, state) {
        return StepContainer(
          children: [
            selifeState.showSelfieBlock == true
                ? SelfieVerify(
                    file: selifeState.selfie,
                  )
                : SelfieCaptureInstructions(),
          ],
        );
      },
      listener: (context, state) => {},
    );
  }
}

class SelfieVerify extends StatelessWidget {
  File file;
  SelfieVerify({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selfie Verification',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Take a photo of yourself',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(2),
              clipBehavior: Clip.hardEdge,
              width: utils.vw(80, context),
              height: utils.vw(80, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  image: FileImage(
                    file,
                  ),
                ),
                border: Border.all(
                  width: 3,
                  color: Color(
                    0xff3f7ed3,
                  ),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    utils.vw(40, context),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          Row(
            children: [
              Expanded(
                child: IntroButtonAlt(
                  callback: () async {
                    final M7CapturedImage? response =
                        await M7LivelynessDetection.instance.detectLivelyness(
                      context,
                      config: M7DetectionConfig(
                        steps: [
                          M7LivelynessStepItem(
                            step: M7LivelynessStep.blink,
                            title: "Blink",
                            isCompleted: false,
                          ),
                          M7LivelynessStepItem(
                            step: M7LivelynessStep.smile,
                            title: "Smile",
                            isCompleted: false,
                          ),
                        ],
                        startWithInfoScreen: false,
                      ),
                    );

                    File file = File(response!.imgPath);

                    print(response!.imgPath);

                    BlocProvider.of<UserBloc>(context).add(
                      SelfieEvents(showSelfieBlock: true, selfie: file),
                    );
                  },
                  label: 'Try again',
                  textColor: const Color(0xff3F7ED3),
                  backgroundColor: const Color(0xffffffff),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: IntroButtonAlt(
                  isDisabled: false,
                  callback: () {},
                  label: 'Looks Good',
                  backgroundColor: const Color(0xff3F7ED3),
                  textColor: const Color(0xffffffff),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SelfieCaptureInstructions extends StatelessWidget {
  SelfieCaptureInstructions({super.key});

  List<String> selfieInstructions = [
    'Picture should have a clear background',
    'Should be ample light',
    'Eyes should be open',
    'Your presence should be within India'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selfie Verification',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Take a photo of yourself',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/illustrations/selfie.svg',
              width: utils.vw(
                50,
                context,
              ),
            ),
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...selfieInstructions.map(
                (e) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/tick.svg',
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: styles.sectionTextStyle(
                            textColor: const Color(0xff767676),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList()
            ],
          ),
          SizedBox(
            height: utils.vh(4, context),
          ),
          IntroButtonAlt(
            callback: () async {
              final M7CapturedImage? response =
                  await M7LivelynessDetection.instance.detectLivelyness(
                context,
                config: M7DetectionConfig(
                  steps: [
                    M7LivelynessStepItem(
                      step: M7LivelynessStep.blink,
                      title: "Blink",
                      isCompleted: false,
                    ),
                    M7LivelynessStepItem(
                      step: M7LivelynessStep.smile,
                      title: "Smile",
                      isCompleted: false,
                    ),
                  ],
                  startWithInfoScreen: false,
                ),
              );

              File file = File(response!.imgPath);

              BlocProvider.of<UserBloc>(context).add(
                SelfieEvents(showSelfieBlock: true, selfie: file),
              );
            },
            label: 'Take Picture',
          ),
        ],
      ),
    );
  }
}
