import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:face_camera/face_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/services/onboarding-service.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:kyc_workflow/digio_config.dart';
import 'package:kyc_workflow/environment.dart';
import 'package:kyc_workflow/gateway_event.dart';
import 'package:kyc_workflow/kyc_workflow.dart';
import '../../styles/styles.dart' as styles;
import '../../utils/utils.dart' as utils;

class OBStepsHeader extends StatefulWidget {
  const OBStepsHeader({super.key});

  @override
  State<OBStepsHeader> createState() => _OBStepsHeaderState();
}

class _OBStepsHeaderState extends State<OBStepsHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
      height: utils.vh(14, context),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffFFCF52),
                border: Border(),
              ),
              width: MediaQuery.of(context).size.width,
              height: 10,
            ),
          ),
          Positioned(
            left: utils.vw(5, context),
            top: utils.vh(2, context),
            child: GestureDetector(
              onTap: () {
                // print(context.)

                if (mainKYCStep.currentKYCStep.index == 0) {
                  //return;
                  context.go('/');
                  return;
                }

                BlocProvider.of<UserBloc>(context).add(
                  ChangeKYCStepEvent(
                    step: KYCStep.values[mainKYCStep.currentKYCStep.index - 1],
                  ),
                );
                //KYCStep.values[mainKYCStep.currentKYCStep.index - 1];
                // print(context.);

                // context.go('/');
              },
              child: Container(
                height: 30,
                width: 30,
                // color: Colors.pink,
                child: SvgPicture.asset(
                  'assets/icons/back.svg',
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, utils.vh(1, context)),
              child: Text(
                '${mainKYCStep.currentKYCStep.index + 1}/${KYCStep.values.length} ',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          // step * MQ / step.length
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            bottom: -8,
            left: ((mainKYCStep.currentKYCStep.index + 1) *
                    MediaQuery.of(context).size.width /
                    KYCStep.values.length) -
                25,
            child: SvgPicture.asset(
              'assets/icons/t-stepper.svg',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class RadioBox extends StatefulWidget {
  String title;
  String desc;
  RadioBox({super.key, required this.title, required this.desc});

  @override
  State<RadioBox> createState() => _RadioBoxState();
}

class _RadioBoxState extends State<RadioBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 15,
            spreadRadius: 0.4,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: double.infinity,
      child: FormBuilder(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: FormBuilderRadioGroup(
                  activeColor: Color(0xff3F7ED3),
                  wrapCrossAxisAlignment: WrapCrossAlignment.start,
                  wrapDirection: Axis.horizontal,
                  initialValue: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(-15),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  name: 'bankAccountSelection',
                  options: [
                    FormBuilderFieldOption(
                      value: true,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: styles.miniTitleStyle(),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.desc,
                              style: styles.sectionTextStyle(
                                textColor: const Color(0xff767676),
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepContainer extends StatefulWidget {
  List<Widget> children;
  StepContainer({super.key, required this.children});

  @override
  State<StepContainer> createState() => _StepContainerState();
}

class _StepContainerState extends State<StepContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...widget.children],
      ),
    );
  }
}

class PricingStep extends StatelessWidget {
  const PricingStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            'Pricing Plan',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Choose a subscription plan to unlock all the functionalities',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PricingBlock(),
              SizedBox(
                width: 20,
              ),
              PricingBlock()
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          IntroButtonAlt(
            callback: () {},
            label: 'Continue',
            textColor: Colors.white,
            backgroundColor: const Color(0xff3F7ED3),
          )
        ],
      ),
    );
  }
}

class PricingBlock extends StatelessWidget {
  const PricingBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            width: 100,
            left: MediaQuery.of(context).size.width * 0.1,
            top: -10,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(
                  0xffF3B617,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Premium',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                  //style: TextStyle(backgroundColor: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.fromLTRB(15, 30, 20, 15),
            width: double.infinity,
            decoration: BoxDecoration(
              //scolor: Colors.pink,
              border: Border.all(
                color: const Color(
                  0xffF3B617,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹20 ₹0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹20 ₹0',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Future \n& Options',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '₹20 ₹0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PANVerificationStep extends StatefulWidget {
  const PANVerificationStep({super.key});

  @override
  State<PANVerificationStep> createState() => _PANVerificationStepState();
}

class _PANVerificationStepState extends State<PANVerificationStep> {
  Map pPromise = {};
  Map digioKYCConfig = {};
  var digioConfig = DigioConfig();

  @override
  Widget build(BuildContext context) {
    final PANCheckFormKey = GlobalKey<FormBuilderState>();
    return BlocConsumer<UserBloc, UserState>(
        builder: (context, state) => StepContainer(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'PAN Verification',
                  style: styles.megaTitleStyle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                panFetchedState.PANFetched == true
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Please Confirm Details',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Following details have been fetched from Xperia Services, Please validate to proceed. This cannot be changed later!',
                                  style: styles.sectionTextStyle(
                                    textColor: const Color(0xff888888),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Pernament Account Number',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff404040),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        panFetchedState.panNumber != null
                                            ? panFetchedState.panNumber!
                                                .toUpperCase()
                                            : '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        'Full Name as per PAN',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff404040),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        panFetchedState.fullName != null
                                            ? panFetchedState.fullName!
                                                .toUpperCase()
                                            : '',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    : const SizedBox(),
                panFetchedState.PANFetched == false
                    ? Text(
                        'PAN card is mandatory for investing in India',
                        style: styles.sectionTextStyle(
                          textColor: const Color(0xff767676),
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                const SizedBox(
                  height: 20,
                ),
                panFetchedState.PANFetched == false
                    ? FormBuilder(
                        key: PANCheckFormKey,
                        onChanged: () async {
                          //  _PANCheckFormKey.currentState?.saveAndValidate();
                          print(PANCheckFormKey.currentState?.isValid);
                          var v =
                              jsonEncode(PANCheckFormKey.currentState?.value);
                          Map<dynamic, dynamic> valueMap = json.decode(v);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormBuilderTextField(
                              name: 'pan',
                              enabled: true,
                              validator: (value) {
                                return value?.length != 10
                                    ? 'Name must be greater than two characters'
                                    : null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Enter your PAN Number',
                                hintText: 'Enter your PAN Number',
                                border: styles.formBorder(),
                                enabledBorder: styles.formBorder(),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                panFetchedState.PANFetched == false
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/safe.svg',
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Your information is safe & encrypted ${PANCheckFormKey.currentState?.isValid}',
                            style: styles.sectionTextStyle(
                              textColor: const Color(0xff000000),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 40,
                ),
                panFetchedState.PANFetched == true &&
                        panFetchedState.isKRA == false
                    ? RichText(
                        text: TextSpan(
                          //text: 'You will be redirected to',
                          children: [
                            TextSpan(
                              text: 'You will be redirected to ',
                              style: styles.sectionTextStyle(
                                textColor: const Color(0xff767676),
                              ),
                            ),
                            TextSpan(
                              text: 'DigiLocker',
                              style: styles.sectionTextStyle(
                                textColor: const Color(0xff0D58A8),
                              ),
                            ),
                            TextSpan(
                              text:
                                  ',a secure Government of India-recommended platform to fetch your PAN & Aadhar document digitally.',
                              style: styles.sectionTextStyle(
                                textColor: const Color(0xff767676),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                panFetchedState.PANFetched == true
                    ? const SizedBox(
                        height: 20,
                      )
                    : const SizedBox(),
                panFetchedState.PANFetched == false
                    ? IntroButtonAlt(
                        callback: () async {
                          //await auth.loginOrRegisterWithPhone(phone: '+919096598887');
                          try {
                            PANCheckFormKey.currentState!.saveAndValidate();
                            if (!PANCheckFormKey.currentState!.isValid) {
                              return;
                            }

                            String pan = PANCheckFormKey
                                .currentState?.value['pan'] as String;

                            pPromise = await obService.panCheck(pan: pan);

                            BlocProvider.of<UserBloc>(context).add(
                              PANFetchedEvent(
                                panFetched: true,
                                panName: pPromise['name'],
                                PAN: pan,
                                isKRA: pPromise['is_kra'],
                              ),
                            );
                          } on DioException catch (e) {
                            print(e.response?.data);
                          }
                        },
                        label: 'Verify',
                        backgroundColor: const Color(0xff3F7ED3),
                        textColor: const Color(0xffffffff),
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: IntroButtonAlt(
                              callback: () {
                                BlocProvider.of<UserBloc>(context).add(
                                  PANFetchedEvent(
                                    panFetched: false,
                                    panName: '',
                                    isKRA: false,
                                    PAN: '',
                                  ),
                                );
                              },
                              label: 'No',
                              textColor: const Color(0xff3F7ED3),
                              backgroundColor: const Color(0xffffffff),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: IntroButtonAlt(
                              callback: () async {
                                await obService.createOnboarding(
                                  pan: pPromise['pan'],
                                  dob: pPromise['dob'],
                                );

                                if (pPromise['is_kra'] == true) {
                                  BlocProvider.of<UserBloc>(context)
                                      .add(ChangeKYCStepEvent(
                                    step: KYCStep.personalInformation,
                                  ));
                                  return;
                                }

                                digioKYCConfig =
                                    await obService.requestDigioKYC();
                                // print(digioKYCConfig);

                                digioConfig.theme.primaryColor = "#3F7ED3";
                                digioConfig.logo =
                                    "https://heytorus.com/assets/icon/group_100_torus.png";
                                digioConfig.environment = Environment.SANDBOX;
                                final kycWorkflowPlugin =
                                    KycWorkflow(digioConfig);
                                kycWorkflowPlugin.setGatewayEventListener(
                                    (GatewayEvent? gatewayEvent) {
                                  if (gatewayEvent!.event == 'kyc.completed') {
                                    const snackBar = SnackBar(
                                      content: Text(
                                          'Congratulations! Your KYC is complete'),
                                    );

                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    BlocProvider.of<UserBloc>(context)
                                        .add(ChangeKYCStepEvent(
                                      step: KYCStep.personalInformation,
                                    ));
                                  }
                                });
                                var workflowResult =
                                    await kycWorkflowPlugin.start(
                                        digioKYCConfig['id'],
                                        digioKYCConfig['number'],
                                        digioKYCConfig['tokenId'],
                                        null);
                              },
                              label: 'Yes, it\'s me',
                              backgroundColor: const Color(0xff3F7ED3),
                              textColor: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
              ],
            ),
        listener: (context, state) => {});
  }
}

class ExchangeSelectionStep extends StatelessWidget {
  const ExchangeSelectionStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Invest in ',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 20,
          ),
          ExchangeSelectionBox(
            title: 'Equity',
            desc: 'Stocks, ETF, IPO and NCD',
            isDisabled: false,
          ),
          const SizedBox(
            height: 25,
          ),
          ExchangeSelectionBox(
            title: 'Mutual Fund',
            isDisabled: false,
            desc:
                'Start a SIP or invest desired amount in leading Mutual Funds',
          ),
          const SizedBox(
            height: 25,
          ),
          ExchangeSelectionBox(
            title: 'Derivatives',
            isDisabled: true,
            desc: 'Future & options, currency',
          ),
          const SizedBox(
            height: 25,
          ),
          IntroButtonAlt(
            callback: () {
              BlocProvider.of<UserBloc>(context).add(ChangeKYCStepEvent(
                step: KYCStep.pennyDrop,
              ));
            },
            label: 'Continue',
            backgroundColor: const Color(0xff3F7ED3),
            textColor: const Color(0xffffffff),
          ),
        ],
      ),
    );
  }
}

class ExchangeSelectionBox extends StatelessWidget {
  String title, desc;
  bool isDisabled;
  ExchangeSelectionBox(
      {super.key,
      required this.title,
      required this.desc,
      required this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return ShadowBox(
      noMargin: true,
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1,
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: styles.miniTitleStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      desc,
                      style: styles.sectionTextStyle(
                        textColor: const Color(0xff767676),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  'assets/icons/tick.svg',
                  width: 25,
                  colorBlendMode: BlendMode.colorBurn,
                  //color: Color(0xffcccccc),
                  //colorFilter: ColorFilter.linearToSrgbGamma(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class M7Live implements M7LivelynessDetection {
//   @override
//   void configure(
//       {required List<M7DetectionThreshold> thresholds,
//       Color lineColor = const Color(0xffab48e0),
//       Color dotColor = const Color(0xffab48e0),
//       double lineWidth = 1.6,
//       double dotSize = 2.0,
//       bool displayLines = true,
//       bool displayDots = true,
//       List<double>? dashValues}) {
//     // TODO: implement configure
//   }

//   @override
//   // TODO: implement contourDotColor
//   Color? get contourDotColor {
//     return this.contourDotColor;
//   }

//   @override
//   // TODO: implement contourDotRadius
//   double? get contourDotRadius => this.contourDotRadius;

//   @override
//   Color? get contourLineColor => this.contourLineColor;

//   @override
//   // TODO: implement contourLineWidth
//   double? get contourLineWidth => this.contourLineWidth;

//   @override
//   // TODO: implement dashGap
//   double get dashGap => this.dashGap;

//   @override
//   // TODO: implement dashLength
//   double get dashLength => this.dashLength;

//   @override
//   // TODO: implement displayDash
//   bool get displayDash => this.displayDash;

//   @override
//   // TODO: implement displayDots
//   bool get displayDots => this.displayDots;

//   @override
//   // TODO: implement displayLines
//   bool get displayLines => this.displayLines;

//   @override
//   // TODO: implement safeAreaPadding
//   EdgeInsets get safeAreaPadding => this.safeAreaPadding;

//   @override
//   // TODO: implement thresholdConfig
//   List<M7DetectionThreshold> get thresholdConfig {
//     return this.thresholdConfig;
//   }

//   M7Live() : super();

//   @override
//   Future<M7CapturedImage?> detectLivelyness(BuildContext context,
//       {required M7DetectionConfig config}) {
//     // TODO: implement detectLivelyness
//     return detectLivelyness(context, config: config);
//   }
// }

class UploadDocumentsStep extends StatelessWidget {
  List<String> documentTypes = [
    'Bank Account Statement (last 6 Months)',
    'Salary Slip (last 3 months)',
    'Demat Account Holding Statement',
    'Form 16',
    'Net worth Certificate',
    'Annual Account',
    'ITR Acknowledgement',
  ];
  UploadDocumentsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return StepContainer(
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Upload Documents',
          style: styles.megaTitleStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Update your income proof by uploading any of the following documents',
          style: styles.sectionTextStyle(
            textColor: const Color(0xff767676),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ShadowBox(
          noMargin: true,
          child: Column(
            children: [
              ...documentTypes
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Radio(
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: false,
                            groupValue: true,
                            onChanged: (bool) {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            e,
                            style: styles.miniTitleStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RadioBox(
          title: 'Account Aggregator',
          desc: 'Upload your documents via  account aggregator',
        ),
        const SizedBox(
          height: 30,
        ),
        IntroButtonAlt(
          callback: () {},
          label: 'Upload',
          backgroundColor: const Color(0xff3F7ED3),
          textColor: const Color(0xffffffff),
        ),
      ],
    );
  }
}
