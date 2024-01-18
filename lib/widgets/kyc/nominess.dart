import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/models/kyc.dart';
import 'package:heytorus/models/user.dart';
import 'package:heytorus/widgets/master.dart';
import '../../styles/styles.dart' as styles;

class NomnieeMiniCard extends StatelessWidget {
  String name;
  int index;
  double allocationPer;
  NomnieeMiniCard({
    super.key,
    required this.name,
    required this.index,
    required this.allocationPer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.pink,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ShadowBox(
        noMargin: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nominee ${index + 1}',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xff414141),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '$allocationPer%',
                      style: TextStyle(fontSize: 16, color: Color(0xff35BD32)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 18,
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<UserBloc>(context).add(
                      DeleteNomineeEvent(id: index + 1),
                    );
                    // print(index);
                  },
                  child: SvgPicture.asset(
                    'assets/icons/delete.svg',
                    width: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NomineeForm extends StatefulWidget {
  NomineeForm({super.key});

  @override
  State<NomineeForm> createState() => _NomineeFormState();
}

class _NomineeFormState extends State<NomineeForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _nformKey = GlobalKey<FormBuilderState>();
  bool isGuardian = false;
  List<String> nRelation = [
    'Brother',
    'Sister',
    'Mother',
    'Father',
    'Husband',
    'Wife',
    'Son',
    'Daughter'
  ];

  String? currentValue = 'Brother';

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Add Nominee ${mainUserState.user.kyc.nominees.length + 1}',
            style: styles.sectionTitleStyle(),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Is the nominee minor? (age less than 18 years)',
            style: styles.sectionTextStyle(
              textColor: const Color(0xff767676),
            ),
          ),
          SizedBox(
            width: 240,
            child: FormBuilderRadioGroup(
              onChanged: (value) {
                setState(() {
                  isGuardian = value!;
                });
              },
              activeColor: Color(0xff3F7ED3),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(-15),
              ),
              wrapCrossAxisAlignment: WrapCrossAlignment.start,
              wrapRunAlignment: WrapAlignment.start,
              name: 'isN18',
              initialValue: false,
              separator: const Expanded(
                flex: 1,
                child: Text(''),
              ),
              options: const [
                FormBuilderFieldOption(
                  value: true,
                  child: Text('Yes'),
                ),
                FormBuilderFieldOption(
                  value: false,
                  child: Text('No'),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FormBuilderTextField(
            name: 'nominePAN',
            enabled: true,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Field cannot empty';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: isGuardian ? 'Guardians PAN Number' : 'PAN  Number',
              hintText: isGuardian ? 'Guardians PAN Number' : 'PAN  Number',
              border: styles.formBorder(),
              enabledBorder: styles.formBorder(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FormBuilderTextField(
            name: 'nomineeFullName',
            enabled: true,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Field cannot empty';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText:
                  isGuardian ? 'Guardians Full Name' : 'Nominee\'s Full Name',
              hintText:
                  isGuardian ? 'Guardians Full Name' : 'Nominee\'s Full Name',
              border: styles.formBorder(),
              enabledBorder: styles.formBorder(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: FormBuilderDateTimePicker(
                  firstDate: DateTime(1969),
                  inputType: InputType.date,
                  //r lastDate: DateTime(2000),
                  name: 'dob',
                  enabled: true,
                  validator: (text) {
                    if (text == null) {
                      return 'Field cannot empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      fill: 1,
                      color: Color(0xff3e7ed3),
                    ),
                    labelText: isGuardian ? 'Guardians DOB' : 'Date of Birth',
                    hintText: isGuardian ? 'Guardians DOB' : 'Date of Birth',
                    border: styles.formBorder(),
                    enabledBorder: styles.formBorder(),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: 'perAllocation',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Field cannot empty';
                    }

                    return null;
                  },
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: '% Allocation',
                    hintText: '% Allocation',
                    border: styles.formBorder(),
                    enabledBorder: styles.formBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Nominee\'s Relation',
            style: styles.miniTitleStyle(),
          ),
          const SizedBox(
            height: 8,
          ),
          Wrap(
            spacing: 5,
            children: [
              ...nRelation
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        //print(e);
                        setState(
                          () {
                            currentValue = e;
                          },
                        );
                        // print(currentValue);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: e == currentValue
                                  ? Color(0xff3F7ED3)
                                  : Color(0xffD3E6FF)),
                          color: e == currentValue
                              ? const Color(0xff3F7ED3)
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          e,
                          style: TextStyle(
                              color: e == currentValue
                                  ? Colors.white
                                  : Color(0xff767676)),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          IntroButton(
            callback: () {
              Nominee n = Nominee();
              n.id = mainUserState.user.kyc.nominees.length + 1;
              bool isValid = _formKey.currentState!.saveAndValidate();
              if (isValid == true) {
                // print(_formKey.currentState!.value);
                n.isEighteenPlus = _formKey.currentState!.value['isN18'];
                n.fullName = _formKey.currentState!.value['nomineeFullName'];
                n.PAN = _formKey.currentState!.value['nominePAN'];
                n.dob = _formKey.currentState!.value['dob'];
                n.relation = currentValue!;
                print(_formKey.currentState!.value['perAllocation']);
                n.allocationPer =
                    double.parse(_formKey.currentState!.value['perAllocation']);

                // n.isEighteenPlus =
                //     _formKey.currentState!.value['perAllocation'];
                BlocProvider.of<UserBloc>(context).add(
                  AddNomineeEvent(nominee: n),
                );

                BlocProvider.of<UserBloc>(context).add(
                  ShowNomineeFormEvent(false),
                );
              }
            },
            label: 'Add Nominee',
            isGradient: false,
          ),
        ],
      ),
    );
  }
}

class NomineeStep extends StatefulWidget {
  const NomineeStep({super.key});

  @override
  State<NomineeStep> createState() => _NomineeStepState();
}

class _NomineeStepState extends State<NomineeStep> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) => {},
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Nominee Details',
                style: styles.megaTitleStyle(),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'You can add up to 3 nominees for your account.',
                style: styles.sectionTextStyle(
                  textColor: const Color(0xff767676),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    for (var i = 0;
                        i < mainUserState.user.kyc.nominees.length;
                        i++)
                      NomnieeMiniCard(
                        name: mainUserState.user.kyc.nominees[i].fullName,
                        index: i,
                        allocationPer:
                            mainUserState.user.kyc.nominees[i].allocationPer,
                      ),
                  ],
                ),
              ),
              mainUserState.user.kyc.nominees.length <= 2
                  ? GestureDetector(
                      onTap: () async {
                        BlocProvider.of<UserBloc>(context).add(
                          ShowNomineeFormEvent(true),
                        );
                      },
                      child: Text(
                        'Add Nominee',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 10,
              ),
              nomineeFormState.showForm ? NomineeForm() : const SizedBox(),
              SizedBox(
                height: 20,
              ),
              nomineeFormState.showForm == false
                  ? IntroButtonAlt(
                      isDisabled: mainUserState.user.kyc.nominees.length == 0,
                      label: 'Continue',
                      callback: () {
                        BlocProvider.of<UserBloc>(context)
                            .add(ChangeKYCStepEvent(
                          step: KYCStep.wetSignatureUpload,
                        ));
                      },
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}


//      const NomineeForm()