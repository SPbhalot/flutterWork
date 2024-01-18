// class AuthBloc extends Bloc<AuthEvents, AuthState> {

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heytorus/bloc/master/master-events.dart';
import 'package:heytorus/bloc/master/master-state.dart';

class MasterBloc extends Bloc<MasterEvents, MasterState> {
  MasterBloc() : super(MainMasterState()) {
    on<ToggleLoadingEvent>((event, emit) {
      mainMasterState.loading = event.loading;
      emit(MainMasterState());
    });
  }
}
