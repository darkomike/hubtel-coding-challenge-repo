enum Banks { momo, absa }

class TransactionModel {
  String name;
  String phone;
  double amount;
  String status;
  String date;
  Banks banks;
  String reference;
  bool isStarred;
  bool forMe;

  TransactionModel(this.amount, this.name, this.phone, this.status,
      this.reference, this.isStarred, this.forMe, this.banks,this.date);
}

final trans = [

];
