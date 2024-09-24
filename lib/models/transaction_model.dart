import 'dart:math';

enum Banks { momo, absa }

enum TransactionStatus { success, failed }

class TransactionModel {
  String name;
  String phone;
  double amount;
  TransactionStatus status;
  String date;
  Banks banks;
  String reference;
  bool isStarred;
  bool forMe;

  TransactionModel(
      {required this.amount,
      required this.name,
      required this.phone,
      required this.status,
      required this.reference,
      required this.isStarred,
      required this.forMe,
      required this.banks,
      required this.date});
}

final trans = [
  TransactionModel(
      amount: 500,
      name: "Emmanuel Rockson Kwabena Uncle Ebo",
      phone: "024 1234 567",
      status: TransactionStatus.success,
      reference: "Cool your heart wai",
      forMe: true,
      banks: Banks.momo,
      date: DateTime.now()
          .add(Duration(days: Random().nextInt(10) + 1))
          .toIso8601String(),
      isStarred: true),
  TransactionModel(
      amount: 500,
      name: "Absa Bank",
      phone: "024 1234 567",
      status: TransactionStatus.failed,
      reference: "Cool your heart wai",
      forMe: true,
      banks: Banks.absa,
      date: DateTime.now().toIso8601String(),
      isStarred: false),
  TransactionModel(
      amount: 500,
      name: "Emmanuel Rockson Kwabena Uncle Ebo",
      phone: "024 1234 567",
      status: TransactionStatus.success,
      reference: "Cool your heart wai",
      forMe: true,
      banks: Banks.momo,
      date: DateTime.now()
          .add(Duration(seconds: Random().nextInt(30) + 200))
          .toIso8601String(),
      isStarred: true),
  TransactionModel(
      amount: 500,
      name: "Absa Bank",
      phone: "024 1234 567",
      status: TransactionStatus.failed,
      reference: "Cool your heart wai",
      forMe: true,
      banks: Banks.absa,
      date: DateTime.now().toIso8601String(),
      isStarred: false),
];
