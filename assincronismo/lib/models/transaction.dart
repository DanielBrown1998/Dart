import 'dart:convert';
import 'account.dart';

class Transaction {
  String id;
  String senderAccountId;
  String receiverAccountId;
  DateTime date;
  double amount;
  double taxes;

  Transaction(
      {required this.id,
      required this.amount,
      required this.receiverAccountId,
      required this.senderAccountId,
      required this.taxes,
      required this.date});

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
        id: map["id"],
        amount: map["amount"],
        receiverAccountId: map["receiverAccountId"],
        senderAccountId: map["senderAccountId"],
        taxes: map["taxes"],
        date: map["date"]);
  }

  factory Transaction.copyWith({
    String? id,
    String? senderAccountId,
    String? receiverAccountId,
    DateTime? date,
    double? amount,
    double? taxes,
    required Transaction original,
  }) {
    return Transaction(
      id: id ?? original.id,
      senderAccountId: senderAccountId ?? original.senderAccountId,
      receiverAccountId: receiverAccountId ?? original.receiverAccountId,
      date: date ?? original.date,
      amount: amount ?? original.amount,
      taxes: taxes ?? original.taxes,
    );
  }

  @override
  String toString() {
    return "$receiverAccountId $senderAccountId";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "amount": amount,
      "receiverAccountId": receiverAccountId,
      "senderAccountId": senderAccountId,
      "taxes": taxes,
      "date": date
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> fromJson(String json) {
    return jsonDecode(json);
  }

  static double calculateTaxesByAccount(Account account, double amount) {
    double tax = 0;
    if (amount > 5000) {
      String? accountType = account.accountType;
      if (accountType != null) {
        switch (accountType.toLowerCase().trim()) {
          case "ambrosia":
            tax += 0.005;
            break;
          case "canjica":
            tax += 0.0033;
            break;
          case "pudim":
            tax += 0.0025;
            break;
          case "brigadeiro":
            tax += 0.0001;
            break;
        }
      } else {
        return 0;
      }
    }
    return tax;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other);
  }

  @override
  int get hashCode => id.hashCode;
}
