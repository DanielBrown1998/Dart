class Accounts {
  final String id;
  final String name;
  final String lastName;
  final double balance;

  Accounts({
    required this.id,
    required this.name,
    required this.lastName,
    required this.balance,
  });

  Accounts.fromMap(Map<String, dynamic> map)
    : id = map["id"],
      name = map["name"],
      lastName = map["lastName"],
      balance = map["balance"];

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "balance": balance,
  };

  @override
  String toString() {
    return "$name $lastName";
  }
}
