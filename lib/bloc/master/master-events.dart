abstract class MasterEvents {}

class ToggleLoadingEvent extends MasterEvents {
  bool loading = false;
  ToggleLoadingEvent(this.loading);
}
