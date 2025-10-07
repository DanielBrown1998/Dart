import 'package:api_rest/service/services.dart' as service;

void main() async {
  String id = "ID001";
  String pin = "14863";
  String email = "dandara@alura.com.br";

  var findId = await service.BytebankAuthService.findId(userId: id);
  print(findId);
  var findEmail = await service.BytebankAuthService.findEmail(email: email);
  print(findEmail);
  var sigin = await service.BytebankAuthService.login(
    email: email,
    password: "123321",
  );
  print(sigin);
  var hasPin = await service.BytebankBalanceService.hasPin(id: id);
  var balance = await service.BytebankBalanceService.getBalance(
    id: id,
    pin: pin,
  );
  print("$hasPin $balance");
}
