import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/kyc/kyc-bloc.dart';
import 'package:heytorus/bloc/kyc/kyc-state.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/layouts/onboarding.dart';
import 'package:heytorus/widgets/kyc/steps.dart';
import '../../utils/utils.dart' as utils;

class PanVerificationPage extends StatefulWidget {
  const PanVerificationPage({super.key});

  @override
  State<PanVerificationPage> createState() => _PanVerificationPageState();
}

class _PanVerificationPageState extends State<PanVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return KYCLayout(
      widget: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // color: Colors.pink,
        child: BlocConsumer<KYCBloc, KYCState>(
          listener: (context, state) => {},
          builder: (context, state) => Column(
            children: [
              const OBStepsHeader(),
              Container(
                padding: const EdgeInsets.all(20),
                height: utils.vh(84.7, context),
                child: const PANVerificationStep(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
