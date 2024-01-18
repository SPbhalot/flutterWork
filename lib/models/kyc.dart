class KYC {
  late int onboardingID;
  late String wetSignatureUrl;
  late String maskedAadharUrl;
  late String panUrl;
  late String PAN = '';
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
  late int? id;
  late bool? isEighteenPlus;
  late String PAN;
  late String fullName;
  late DateTime dob;
  late double allocationPer;
  late String relation;
  Nominee({this.id, this.isEighteenPlus});
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
  late String accountNumber;
  late String IFSC;
  late String bankName;
  late String accountHolder;
  late String branch;
  late bool isValid;
  BankAccount({
    required this.accountNumber,
    required this.IFSC,
    required this.accountHolder,
    required this.branch,
    required this.isValid,
    required this.bankName,
  });
}
