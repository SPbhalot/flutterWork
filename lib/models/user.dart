import 'package:heytorus/models/kyc.dart';

class User {
  late String id;
  late String firstName;
  late String middleName;
  late String lastName;
  late StockPlan stockPlan;
  late BankAccount bankAccount;
  late String email;
  late String phone;
  KYC kyc = KYC();
  User();
}
