import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/widgets/master.dart';
import 'package:heytorus/widgets/kyc/steps.dart';
import '../../styles/styles.dart' as styles;

class PersonalInformationStep extends StatefulWidget {
  const PersonalInformationStep({super.key});

  @override
  State<PersonalInformationStep> createState() =>
      _PersonalInformationStepState();
}

class _PersonalInformationStepState extends State<PersonalInformationStep> {
  final _personalInfomationFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StepContainer(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Personal Information',
            style: styles.megaTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Your information is safe with us.',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          FormBuilder(
            onChanged: () {
              // _personalInfomationFormKey.currentState?.saveAndValidate();
              var v =
                  jsonEncode(_personalInfomationFormKey.currentState?.value);
              Map<dynamic, dynamic> valueMap = json.decode(v);
              print(valueMap);
            },
            key: _personalInfomationFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KYCRadioGroup(
                  label: 'Gender',
                  values: const [
                    'Male',
                    'Female',
                  ],
                  groupName: 'gender',
                ),
                const SizedBox(
                  height: 30,
                ),
                FormBuilderTextField(
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  name: 'fathers_name',
                  enabled: true,
                  decoration: styles.formFieldInputDecorationAlt(
                      hintText: 'Father\'s Name', labelText: 'Father\'s Name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                KYCDropDown(
                  name: 'income_bracket',
                  label: 'Income Bracket',
                  values: const [
                    'Up to Rs.3 lakh',
                    'Rs 3 lakh to 6 lakh ',
                    'Rs 6 lakh to 9 lakh',
                    'Rs 9 lakh to Rs 12 lakh',
                    'Rs 12 lakh to Rs 15 lakh'
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCRadioGroup(
                  label: 'Trading Experience',
                  values: const [
                    '0-1 years',
                    '1-3 Years',
                    '3-5 Years',
                    '5 & Above'
                  ],
                  groupName: 'trading_experience',
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCRadioGroup(
                  label: 'Is your Tax residency other than India',
                  values: const [
                    'Yes',
                    'No',
                  ],
                  groupName: 'tax_residency',
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCRadioGroup(
                  label: 'Politically exposed person (PEP)',
                  values: const [
                    'Yes',
                    'No',
                  ],
                  groupName: 'politically_exposed',
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCRadioGroup(
                  label: 'Related to PEP',
                  values: const [
                    'Yes',
                    'No',
                  ],
                  groupName: 'related_to_pep',
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCRadioGroup(
                  label: 'DIS Booklet',
                  values: const [
                    'Yes',
                    'No',
                  ],
                  groupName: 'dis_booklet',
                ),
                const SizedBox(
                  height: 30,
                ),
                KYCDropDown(
                  name: 'source_of_wealth',
                  label: 'Source of Wealth',
                  values: const [
                    'Business',
                    'Salary',
                    'Investment',
                    'Other',
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                IntroButtonAlt(
                  callback: () {
                    _personalInfomationFormKey.currentState?.saveAndValidate();
                    if (_personalInfomationFormKey.currentState?.isValid ==
                        true) {
                      BlocProvider.of<UserBloc>(context).add(ChangeKYCStepEvent(
                        step: KYCStep.exhangeSelection,
                      ));
                      return;
                    }
                  },
                  label: 'Continue',
                  backgroundColor: const Color(0xff3F7ED3),
                  textColor: const Color(0xffffffff),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//class FormBuilderValidators {}

class KYCRadioGroup extends StatefulWidget {
  String groupName, label;
  List<String> values;
  KYCRadioGroup({
    super.key,
    required this.groupName,
    required this.label,
    required this.values,
  });

  @override
  State<KYCRadioGroup> createState() => _KYCRadioGroupState();
}

class _KYCRadioGroupState extends State<KYCRadioGroup> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: styles.miniTitleStyle(textColor: const Color(0xff767676)),
          ),
          const SizedBox(
            height: 10,
          ),
          FormBuilderRadioGroup(
            activeColor: const Color(0xff3F7ED3),
            separator: const SizedBox(width: 20),
            name: widget.groupName,
            initialValue: widget.values[0],
            controlAffinity: ControlAffinity.leading,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            decoration: const InputDecoration(
              isDense: true,
              alignLabelWithHint: false,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(-10),
            ),
            wrapCrossAxisAlignment: WrapCrossAlignment.start,
            wrapRunAlignment: WrapAlignment.start,
            options: [
              ...widget.values
                  .map(
                    (e) => FormBuilderFieldOption(
                      value: e,
                    ),
                  )
                  .toList()
            ],
          ),
        ],
      ),
    );
  }
}

class KYCDropDown extends StatefulWidget {
  List<String> values;
  String label;
  String name;
  KYCDropDown(
      {super.key,
      required this.values,
      required this.label,
      required this.name});

  @override
  State<KYCDropDown> createState() => _KYCDropDownState();
}

class _KYCDropDownState extends State<KYCDropDown> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      isDense: true,
      name: widget.name,
      //initialValue: widget.values[0],
      isExpanded: true,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.label,
        border: styles.formBorder(),
        enabledBorder: styles.formBorder(),
      ),
      items: [
        ...widget.values
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList()
      ],
    );
  }
}
