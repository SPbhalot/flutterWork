import 'dart:io';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:heytorus/models/user.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/kyc.dart';

abstract class UserEvents {}

class MainUserEvent extends UserEvents {
  User user;
  MainUserEvent({required this.user});
}

class AddNomineeEvent extends UserEvents {
  Nominee nominee;
  AddNomineeEvent({required this.nominee});
}

class ResumeJourneyEvent extends UserEvents {
  String currentJourney;
  ResumeJourneyEvent({required this.currentJourney});
}

class SelfieEvents extends UserEvents {
  bool showSelfieBlock;
  File? selfie;
  SelfieEvents({required this.showSelfieBlock, this.selfie});
}

class DeleteNomineeEvent extends UserEvents {
  int id;
  DeleteNomineeEvent({required this.id});
}

class ShowNomineeFormEvent extends UserEvents {
  bool show = false;
  ShowNomineeFormEvent(this.show);
}

class ChangeKYCStepEvent extends UserEvents {
  KYCStep step;
  ChangeKYCStepEvent({required this.step});
}

class PennyDropSuccess extends UserEvents {
  BankAccount ba;
  PennyDropSuccess({required this.ba});
}

// Pan Check
class PANFetchedEvent extends UserEvents {
  bool panFetched = false;
  bool isKRA;
  String? panName, PAN;
  PANFetchedEvent(
      {required this.panFetched, this.panName, this.PAN, required this.isKRA});
}

class TogglePennyDropEvent extends UserEvents {
  bool showPennyDrop = false;
  TogglePennyDropEvent({required this.showPennyDrop});
}

// WetSignature
class ToggleWetSignatureBlockEvent extends UserEvents {
  bool show;
  SignatureUploadType? uploadType;
  File? file;
  ToggleWetSignatureBlockEvent({
    required this.show,
    this.uploadType,
    this.file,
  });
}

class ToggleWetSignatatureDrawnEvent extends UserEvents {
  bool drawn;
  ToggleWetSignatatureDrawnEvent({required this.drawn});
}
