import 'dart:convert';

class Account {
  String id;
  String name;
  String lastname;
  String balance;
  String accountType;

  Account(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.balance,
      required this.accountType});

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      lastname: map['lastName'],
      balance: map['balance'],
      accountType: map['accountType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'balance': balance,
      'accountType': accountType
    };
  }

  @override
  String toString() {
    return 'Account{id: $id, name: $name, lastname: $lastname, balance: $balance, accountType: $accountType}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.id == id &&
        other.name == name &&
        other.lastname == lastname &&
        other.balance == balance &&
        other.accountType == accountType;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ lastname.hashCode ^ balance.hashCode;
  }

  Account copyWith({
    String? id,
    String? name,
    String? lastname,
    String? balance,
    String? accountType
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      balance: balance ?? this.balance,
      accountType: accountType ?? this.accountType
    );
  }

  toJson() => json.encode(toMap());

  factory Account.fromjson(String jsonFile) =>
      Account.fromMap(json.decode(jsonFile));
}
