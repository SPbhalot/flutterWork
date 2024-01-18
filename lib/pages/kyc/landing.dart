import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/user/user-bloc.dart';
import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/layouts/onboarding.dart';
import 'package:heytorus/services/local-storage.dart';
import 'package:heytorus/widgets/kyc/forms.dart';
import 'package:heytorus/widgets/kyc/steps.dart';

class KYCLandingPage extends StatefulWidget {
  const KYCLandingPage({super.key});

  @override
  State<KYCLandingPage> createState() => _KYCLandingPageState();
}

class _KYCLandingPageState extends State<KYCLandingPage> {
  Future<void> resumeJourney() async {
    String? currentOBStep = await securedStorageService.read(
      key: 'current_ob_step',
    );
    if (currentOBStep != null) {
      BlocProvider.of<UserBloc>(context).add(
        ResumeJourneyEvent(currentJourney: currentOBStep),
      );
    }
  }

  @override
  void initState() {
    resumeJourney();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KYCLayout(
      widget: SizedBox(
        // height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // color: Colors.pink,
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) => {
            // print('Listenrrt,,,,'),
          },
          builder: (context, state) {
            return Column(
              children: [
                const OBStepsHeader(),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height - 110,
                  color: Colors.white,
                  child: mainKYCStep.currentKYCStep.widget,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class KYCContent extends StatefulWidget {
  const KYCContent({super.key});

  @override
  State<KYCContent> createState() => _KYCContentState();
}

class _KYCContentState extends State<KYCContent> {
  @override
  Widget build(BuildContext context) {
    return const PersonalInformationStep();
  }
}


// NomineeStep()
// LinkBankAccountStep()
// WetSignatureSelectionStep()
// ExchangeSelectionStep()
// SelfieVerificationStep()
// UploadDocumentsStep
// PersonalInformationStep()
