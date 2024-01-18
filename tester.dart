class User {
  late String firstName;
  late String middleName;
  late String lastName;
  late StockPlan stockPlan;
  late BankAccount bankAccount;
  late String email;
  late String phone;
  String hello() {
    return firstName;
  }

  User();
}

class KYC {
  late User user;
  late String wetSignatureUrl;
  late String maskedAadharUrl;
  late String panUrl;
  late String selfie;
  List<Nominee> nominees = [];
  late bool isKRA;
  late TradingExiperience tradingExiperience;
  late bool isTaxResidencyIndian;
  late bool isPoliticallyExposed;
  late bool isRelatedToPEP;
  late bool isDISBooklet;
  late StockPlan stockPlan;
  late BankAccount bankAccount;
}

class Nominee {
  late bool isEighteenPlus;
  late String PAN;
  late String fullName;
  late DateTime dob;
  late double allocationPer;
  late NomineeRelation relation;
}

enum NomineeRelation {
  father,
  brother,
  sister,
  husband,
  wife,
  son,
  daughter,
  other
}

enum TradingExiperience {
  zeroToOne,
  oneToThree,
  threeToFive,
  fivePlus,
}

enum StockPlan {
  basic,
  premium,
}

class BankAccount {
  String? accountNumber;
  String? IFSC;
  String? branch;
  bool? isValid;
  BankAccount({this.accountNumber, this.IFSC, this.branch, this.isValid});
}

void main() {
  User user = User();
  user.firstName = 'Hello';
  user.lastName = 'Hello';
  KYC userKYC = KYC();
  userKYC.bankAccount = BankAccount();
  Nominee nominee1 = Nominee();
  Nominee nominee2 = Nominee();
  nominee1.relation = NomineeRelation.daughter;
  nominee2.relation = NomineeRelation.father;
  userKYC.bankAccount.accountNumber = '6612217140';
  userKYC.user = user;
  userKYC.nominees = [];
  userKYC.nominees.add(nominee1);
  userKYC.nominees.add(nominee2);
}
