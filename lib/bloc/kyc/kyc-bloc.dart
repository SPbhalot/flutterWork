import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/kyc/kyc-events.dart';
import 'package:heytorus/bloc/kyc/kyc-state.dart';

class KYCBloc extends Bloc<KYCEvents, KYCState> {
  KYCBloc() : super(MainKYCState());
}
