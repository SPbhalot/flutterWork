import 'package:heytorus/bloc/user/user-events.dart';
import 'package:heytorus/bloc/user/user-state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/models/user.dart';
import 'package:heytorus/services/local-storage.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(MainUserState()) {
    on<AddNomineeEvent>((event, emit) {
      // mainUserState.user.firstName = 'ss';
      mainUserState.user.kyc.nominees.add(event.nominee);
      emit(MainUserState());
    });

    on<ResumeJourneyEvent>((event, emit) {
      switch (event.currentJourney) {
        case 'KYCStep.personalInformation':
          mainKYCStep.currentKYCStep = KYCStep.personalInformation;
        case 'KYCStep.panCheckexhangeSelection':
          mainKYCStep.currentKYCStep = KYCStep.panCheck;
        case 'KYCStep.pennyDrop':
          mainKYCStep.currentKYCStep = KYCStep.pennyDrop;
        case 'KYCStep.nominees':
          mainKYCStep.currentKYCStep = KYCStep.nominees;
        case 'KYCStep.selfieUpload':
          mainKYCStep.currentKYCStep = KYCStep.selfieUpload;
        case 'KYCStep.wetSignatureUpload':
          mainKYCStep.currentKYCStep = KYCStep.wetSignatureUpload;
        case 'KYCStep.previewAOFForm':
          mainKYCStep.currentKYCStep = KYCStep.previewAOFForm;
          break;
      }
      emit(
        UserKYCStepState(
          mainKYCStep.currentKYCStep,
        ),
      );
    });

    on<DeleteNomineeEvent>((event, emit) {
      mainUserState.user.kyc.nominees
          .removeWhere((element) => element.id == event.id);
      emit(MainUserState());
      emit(NomineeFormState());
    });

    on<ChangeKYCStepEvent>((event, emit) async {
      mainKYCStep.currentKYCStep = event.step;
      //print(event.step);
      await securedStorageService.write(
        key: 'current_ob_step',
        value: event.step.toString(),
      );
      emit(
        UserKYCStepState(
          mainKYCStep.currentKYCStep,
        ),
      );
    });

    on<SelfieEvents>((event, emit) {
      selifeState.showSelfieBlock = event.showSelfieBlock;
      if (event.selfie != null) {
        selifeState.selfie = event.selfie!;
      }
      // print(event.show);
      emit(SelifeState());
      emit(MainUserState());
    });

    on<ShowNomineeFormEvent>((event, emit) {
      nomineeFormState.showForm = event.show;
      print(event.show);
      //emit(MainUserState());
      emit(NomineeFormState());
    });

    on<PennyDropSuccess>((event, emit) {
      emit(MainUserState());
      emit(ValidBankAccountState());
    });

    on<PANFetchedEvent>((event, emit) {
      panFetchedState.PANFetched = event.panFetched;
      panFetchedState.fullName = event.panName;
      panFetchedState.panNumber = event.PAN;
      emit(MainUserState());
    });

    // Wet Signature

    on<ToggleWetSignatureBlockEvent>((event, emit) {
      wetSignatureState.showDrawSignatureBlock = event.show;
      if (event.show == true) {
        if (event.file != null) {
          wetSignatureState.file = event.file!;
        }
      }

      wetSignatureState.signatureUploadType = event.uploadType!;
      emit(MainUserState());
      emit(WetSignatureState());
    });

    on<ToggleWetSignatatureDrawnEvent>((event, emit) {
      wetSignatureState.signatureDrawn = event.drawn;
      emit(MainUserState());
      emit(WetSignatureState());
    });

    // PennyDrop
    on<TogglePennyDropEvent>((event, emit) {
      bankAccountState.showPennyDropBlock = event.showPennyDrop;
      emit(BankAccountState());
      emit(MainUserState());
    });
  }
}
