import 'dart:io';
import 'package:flutter/material.dart';
import 'package:heytorus/models/kyc.dart';
import 'package:heytorus/widgets/kyc/aof.dart';
import 'package:heytorus/widgets/kyc/bank.dart';
import 'package:heytorus/widgets/kyc/forms.dart';
import 'package:heytorus/widgets/kyc/nominess.dart';
import 'package:heytorus/widgets/kyc/selfie.dart';
import 'package:heytorus/widgets/kyc/steps.dart';
import 'package:heytorus/widgets/kyc/wet-signature.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/user.dart';

enum SignatureUploadType {
  draw,
  upload,
}

enum KYCStep<T> {
  panCheck<Widget>(PANVerificationStep()),
  exhangeSelection<Widget>(ExchangeSelectionStep()),
  personalInformation<Widget>(PersonalInformationStep()),
  pennyDrop<Widget>(PennyDropStep()),
  nominees<Widget>(NomineeStep()),
  selfieUpload<Widget>(SelfieVerificationStep()),
  wetSignatureUpload<Widget>(WetSignatureSelectionStep()),
  previewAOFForm<Widget>(PreviewAOFForm());

  const KYCStep(this.widget);
  final Widget widget;
}

abstract class UserState {}

class MainUserState extends UserState {
  User user = User();
  MainUserState();
}

class SelifeState extends UserState {
  late File selfie;
  bool showSelfieBlock = false;
}

class NomineeFormState extends UserState {
  bool showForm = false;
  bool isAbove18 = true;
  NomineeFormState();
}

class PANFetchedState extends UserState {
  bool PANFetched = false;
  String? panNumber, fullName;
  String? dob;
  bool? isKRA;
  PANFetchedState({PANFetched, panNumber, fullName, dob});
}

class UserKYCStepState extends UserState {
  KYCStep currentKYCStep;
  UserKYCStepState(this.currentKYCStep);
}

class WetSignatureState extends UserState {
  bool showDrawSignatureBlock = false;
  SignatureUploadType signatureUploadType = SignatureUploadType.upload;
  bool signatureDrawn = false;
  late File file;
  WetSignatureState();
}

class BankAccountState extends UserState {
  bool showPennyDropBlock = false;
  BankAccountState();
}

class ValidBankAccountState extends UserState {
  late BankAccount bankAccount = BankAccount(
    accountNumber: '',
    IFSC: 'IFSC',
    accountHolder: 'accountHolder',
    branch: 'branch',
    isValid: true,
    bankName: '',
  );
  ValidBankAccountState();
}

MainUserState mainUserState = MainUserState();
PANFetchedState panFetchedState = PANFetchedState();
NomineeFormState nomineeFormState = NomineeFormState();
WetSignatureState wetSignatureState = WetSignatureState();
BankAccountState bankAccountState = BankAccountState();
ValidBankAccountState validBankAccount = ValidBankAccountState();

SelifeState selifeState = SelifeState();
UserKYCStepState mainKYCStep = UserKYCStepState(
  KYCStep.nominees,
);
