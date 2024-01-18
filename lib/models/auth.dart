class OTP {
  String? digit1, digit2, digit3, digit4, digit5, digit6;

  String getString() {
    return '${digit1 ?? ''}${digit2 ?? ''}${digit3 ?? ''}${digit4 ?? ''}${digit5 ?? ''}${digit6 ?? ''}';
  }
}
