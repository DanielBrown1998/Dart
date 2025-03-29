import 'dart:convert';

class Account {
  String id;
  String name;
  String lastname;
  String balance;

  Account({
    required this.id,
    required this.name,
    required this.lastname,
    required this.balance,
  });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'],
      name: map['name'],
      lastname: map['lastName'],
      balance: map['balance'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'balance': balance,
    };
  }

  @override
  String toString() {
    return 'Account{id: $id, name: $name, lastname: $lastname, balance: $balance}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.id == id &&
        other.name == name &&
        other.lastname == lastname &&
        other.balance == balance;
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
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      balance: balance ?? this.balance,
    );
  }

  toJson() => json.encode(toMap());

  factory Account.fromjson(String jsonFile) => Account.fromMap(json.decode(jsonFile));
}
