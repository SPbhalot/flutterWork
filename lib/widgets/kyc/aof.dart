// import 'package:esign_plugin/digio_config.dart';
// import 'package:esign_plugin/environment.dart';
// import 'package:esign_plugin/esign_plugin.dart';
// import 'package:esign_plugin/gateway_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/widgets/master.dart';

import '../../styles/styles.dart' as styles;

class PreviewAOFForm extends StatefulWidget {
  const PreviewAOFForm({super.key});

  @override
  State<PreviewAOFForm> createState() => _PreviewAOFFormState();
}

class _PreviewAOFFormState extends State<PreviewAOFForm> {
  void showBottomSheet() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FormBuilder(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Terms and Conditions',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FormBuilderCheckboxGroup(
                      initialValue: const [
                        true,
                        true,
                      ],
                      name: 'tnc',
                      wrapDirection: Axis.vertical,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      options: const [
                        FormBuilderFieldOption(
                          value: true,
                          child: Text(
                            'I confirm that siddhesh@greyaxis.io belongs to me and verified with Reliance Securities',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: true,
                          child: Text(
                            'I agree the Terms of Service and Private Policy of www.digio.in',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IntroButtonAlt(
                callback: () async {
                  /*  nn
                  digioConfig.theme.primaryColor = "#3F7ED3";
                  digioConfig.logo =
                      "https://heytorus.com/assets/icon/group_100_torus.png";
                  digioConfig.environment = Environment.SANDBOX;

                  final _esignPlugin = EsignPlugin(digioConfig);
                  _esignPlugin
                      .setGatewayEventListener((GatewayEvent? gatewayEvent) {
                    if (gatewayEvent!.event == 'sign.aadhaar.completed') {
                      Navigator.pop(context);

                      context.go('/');
                    }
             
                  });
                  var esignResult = await _esignPlugin.start(
                      "DID231219091808740KZZ6ZT27MTCZAC",
                      "9096598887",
                      "GWT***",
                      null);

                nno */
                  // print(gatewayEvent.message.);
                },
                label: 'Proceed to esign',
                backgroundColor: const Color(0xff3F7ED3),
                textColor: const Color(0xffffffff),
              ),
            ],
          ),
        );
      },
    );
  }

  //var digioConfig = DigioConfig();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<UserBloc, UserState>(
              builder: (context, state) => Text(
                'Preview AOF Form',
                style: styles.megaTitleStyle(),
              ),
              listener: (context, state) => {},
            ),
            const SizedBox(
              height: 20,
            ),
            ShadowBox(
              noMargin: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: styles.sectionTitleStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AOFInfoBlock(
                      title: 'Full Name', desc: 'Siddhesh Balkrishna Khelya'),
                  AOFInfoBlock(
                      title: 'Father\'s Name', desc: 'Balkrishna Khelya'),
                  AOFInfoBlock(
                      title: 'Email Address', desc: 'siddhesh@greyaxis.io'),
                  AOFInfoBlock(title: 'Mobile Number', desc: '+91-9096598887'),
                  AOFInfoBlock(
                    title: 'Permanent Address',
                    desc:
                        'Room No- 203, 2nd floor, New Wing Building Bombay Hospital and Medical Research Centre, 12, Marine Lines, Mumbai, Maharashtra 400020, India',
                  ),
                  AOFInfoBlock(
                    title: 'Correspondence Address',
                    desc:
                        'Room No- 203, 2nd floor, New Wing Building Bombay Hospital and Medical Research Centre, 12, Marine Lines, Mumbai, Maharashtra 400020, India',
                  ),
                  AOFInfoBlock(title: 'Trading Experience', desc: '1-5 Years'),
                  AOFInfoBlock(title: 'Source of Wealth', desc: 'Business'),
                  AOFInfoBlock(title: 'Mobile ', desc: 'Business'),
                  AOFInfoBlock(
                      title: 'Is your Tax residency other than India',
                      desc: 'No'),
                  AOFInfoBlock(
                      title: 'Politically exposed person (PEP)', desc: 'No'),
                  AOFInfoBlock(title: 'Related to PEP', desc: 'No'),
                  AOFInfoBlock(title: 'DIS Booklet', desc: 'No'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShadowBox(
              noMargin: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bank Details',
                    style: styles.sectionTitleStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AOFInfoBlock(
                    title: 'Bank Name',
                    desc: 'Siddhesh Balkrishna Khelya',
                  ),
                  AOFInfoBlock(
                    title: 'Account Number',
                    desc: '6612217140',
                  ),
                  AOFInfoBlock(
                    title: 'Bank Name',
                    desc: 'Siddhesh Balkrishna Khelya',
                  ),
                  AOFInfoBlock(
                    title: 'Bank Branch',
                    desc: 'Virar West - 401303',
                  ),
                  AOFInfoBlock(
                    title: 'MICR Code',
                    desc: 'KKBK0000629',
                  ),
                  AOFInfoBlock(
                    title: 'IFSC Code',
                    desc: 'KKBK0000629',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ShadowBox(
              noMargin: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nominee Details',
                    style: styles.sectionTitleStyle(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  for (var i = 0;
                      i < mainUserState.user.kyc.nominees.length;
                      i++)
                    NomineeAOF(
                      index: '${i + 1}',
                      isLast: i == mainUserState.user.kyc.nominees.length - 1
                          ? true
                          : false,
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            IntroButtonAlt(
              callback: () {
                showBottomSheet();
              },
              label: 'Proceed to esign',
              backgroundColor: const Color(0xff3F7ED3),
              textColor: const Color(0xffffffff),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class AOFInfoBlock extends StatelessWidget {
  String title, desc;
  AOFInfoBlock({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff767676),
          ),
        ),
        Text(
          desc,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

class NomineeAOF extends StatefulWidget {
  bool isLast;
  String index;
  NomineeAOF({super.key, required this.isLast, required this.index});

  @override
  State<NomineeAOF> createState() => _NomineeAOFState();
}

class _NomineeAOFState extends State<NomineeAOF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !widget.isLast ? const EdgeInsets.fromLTRB(0, 0, 0, 15) : null,
      padding: !widget.isLast ? const EdgeInsets.fromLTRB(0, 0, 0, 15) : null,
      width: double.infinity,
      decoration: !widget.isLast
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Color(0xfff1f1f1),
                ),
              ),
            )
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nominee ${widget.index}',
            style: styles.sectionTitleStyle(),
          ),
          AOFInfoBlock(
            title: 'Full Name',
            desc: 'Siddhesh Balkrishna Khelya',
          ),
          AOFInfoBlock(
            title: 'Relationship',
            desc: 'Brother',
          ),
          AOFInfoBlock(
            title: 'Bank Branch',
            desc: '28/03/1995',
          ),
          AOFInfoBlock(
            title: 'Percentage Allocation',
            desc: '50%',
          ),
          AOFInfoBlock(
            title: 'PAN',
            desc: 'DHPPK7300Q',
          ),
        ],
      ),
    );
  }
}
