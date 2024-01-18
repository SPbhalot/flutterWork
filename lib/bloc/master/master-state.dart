abstract class MasterState {}

class MainMasterState extends MasterState {
  bool loading = false;
  MainMasterState();
}

MainMasterState mainMasterState = MainMasterState();
