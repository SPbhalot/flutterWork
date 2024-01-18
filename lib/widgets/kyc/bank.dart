import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/models/kyc.dart';
import 'package:heytorus/models/user.dart';
import 'package:heytorus/services/onboarding-service.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/kyc/aof.dart';
import '../../utils/utils.dart' as utils;
import '../../styles/styles.dart' as styles;
import 'package:flutter/material.dart';
import 'package:heytorus/widgets/kyc/steps.dart';

class PennyDropStep extends StatefulWidget {
  const PennyDropStep({super.key});

  @override
  State<PennyDropStep> createState() => _PennyDropStepState();
}

class _PennyDropStepState extends State<PennyDropStep> {
  @override
  Widget build(BuildContext context) {
    return StepContainer(
      children: [
        BlocConsumer<UserBloc, UserState>(
          builder: (context, state) =>
              bankAccountState.showPennyDropBlock == false
                  ? const LinkBankAccountStep()
                  : BankAccountDetails(),
          listener: (context, state) => {},
        )
      ],
    );
  }
}

class LinkBankAccountStep extends StatefulWidget {
  const LinkBankAccountStep({super.key});

  @override
  State<LinkBankAccountStep> createState() => _LinkBankAccountStepState();
}

class _LinkBankAccountStepState extends State<LinkBankAccountStep> {
  final _bankAcccountFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Link your Bank Account',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          FormBuilder(
            key: _bankAcccountFormKey,
            child: Column(
              children: [
                Text(
                  'Bank account is required so you can manage your funds. Add bank details to link your account',
                  style: styles.sectionTextStyle(
                    textColor: const Color(0xff767676),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RadioBox(
                  title: 'Enter Bank Details',
                  desc: 'Add your Account Number, IFSC Code manually',
                )
                // FormBuilderRadioGroup(
                //   name: 'bankAccountSelection',
                //   initialValue: 'pennyDrop',
                //   wrapCrossAxisAlignment: WrapCrossAlignment.start,
                //   wrapDirection: Axis.horizontal,
                //   decoration: const InputDecoration(
                //     border: InputBorder.none,
                //     contentPadding: EdgeInsets.all(-15),
                //   ),
                //   options: [
                //     FormBuilderFieldOption(
                //       value: 'pennyDrop',
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             'Enter Bank Details',
                //             style: styles.miniTitleStyle(),
                //           ),
                //           const SizedBox(height: 5),
                //           Text(
                //             'Add your account numbert, IFSC Code manually',
                //             style: styles.sectionTextStyle(
                //               textColor: const Color(0xff767676),
                //             ),
                //             softWrap: true,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          IntroButton(
            callback: () {
              BlocProvider.of<UserBloc>(context).add(
                TogglePennyDropEvent(showPennyDrop: true),
              );
            },
            label: 'Continue',
            isGradient: false,
          )
        ],
      ),
    );
  }
}

class BankAccountDetails extends StatefulWidget {
  const BankAccountDetails({super.key});

  @override
  State<BankAccountDetails> createState() => _BankAccountDetailsState();
}

class _BankAccountDetailsState extends State<BankAccountDetails> {
  final GlobalKey<FormBuilderState> _bankAccountDetailsForm =
      GlobalKey<FormBuilderState>();

  void showBottomSheet(BankAccount ba) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: utils.vh(40, context),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // BankAccountLine(
              //   desc: ba.bankName,
              //   title: 'Bank Name',
              // ),
              BankAccountLine(
                desc: ba.accountHolder,
                title: 'Account Holder Name',
              ),
              BankAccountLine(
                desc: ba.accountNumber,
                title: 'Account Number',
              ),
              BankAccountLine(
                desc: ba.IFSC,
                title: 'IFSC Code',
              ),
              // r
              IntroButtonAlt(
                callback: () async {
                  Navigator.pop(context);

                  BlocProvider.of<UserBloc>(context).add(ChangeKYCStepEvent(
                    step: KYCStep.nominees,
                  ));
                },
                label: 'Link Bank Account',
                backgroundColor: const Color(0xff3F7ED3),
                textColor: const Color(0xffffffff),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Bank Details',
          style: styles.megaTitleStyle(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Bank account is required so you can manage your funds. Add bank details to link your account',
          style: styles.sectionTextStyle(
            textColor: const Color(0xff767676),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        FormBuilder(
          key: _bankAccountDetailsForm,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'accountNumber',
                enabled: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Field cannot empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Account Number',
                  hintText: 'Account Number',
                  border: styles.formBorder(),
                  enabledBorder: styles.formBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              FormBuilderTextField(
                name: 'ifsc',
                enabled: true,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Field cannot empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'IFSC Code',
                  hintText: 'IFSC Code',
                  border: styles.formBorder(),
                  enabledBorder: styles.formBorder(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              child: IntroButtonAlt(
                callback: () {
                  BlocProvider.of<UserBloc>(context).add(
                    TogglePennyDropEvent(showPennyDrop: false),
                  );
                },
                label: 'Back',
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
                callback: () async {
                  _bankAccountDetailsForm.currentState?.saveAndValidate();

                  if (_bankAccountDetailsForm.currentState?.isValid == true) {
                    var v =
                        jsonEncode(_bankAccountDetailsForm.currentState?.value);
                    Map<dynamic, dynamic> valueMap = json.decode(v);
                    print(valueMap);
                    try {
                      Map bData = await obService.pennyDrop(
                        accountNumber: valueMap['accountNumber'],
                        ifsc: valueMap['ifsc'],
                      );

                      // BlocProvider.of<UserBloc>(context).add(
                      //   PennyDropSuccess(
                      //     ba: BankAccount(
                      //       IFSC: bData['ifsc'], accountHolder: '', branch: '', accountNumber: '',
                      //     ),
                      //   ),
                      // );

                      showBottomSheet(
                        BankAccount(
                          accountHolder: bData['accountName'],
                          accountNumber: bData['accountNumber'],
                          branch: 'XYZ',
                          isValid: true,
                          bankName: 'XYZ',
                          IFSC: bData['ifsc'],
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                label: 'Verify',
                backgroundColor: const Color(0xff3F7ED3),
                textColor: const Color(0xffffffff),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class BankAccountLine extends StatelessWidget {
  String title;
  String desc;
  BankAccountLine({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xfff2f2f2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: utils.vw(4, context),
            ),
          ),
          Text(
            desc,
            style: TextStyle(
                fontSize: utils.vw(4, context),
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
