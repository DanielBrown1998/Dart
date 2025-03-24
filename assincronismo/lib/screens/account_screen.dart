import 'dart:io';
import 'package:assincronismo/models/account.dart';
import "package:assincronismo/services/account_service.dart";

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializerStream() {
    _accountService.stream.listen(
      (event) {
        print(event);
      },
    );
  }

  _getAllAccounts() async {
    List<Account> accounts = await _accountService.getAll();

    for (Account account in accounts) {
      print(account.name);
      print(account.lastname);
      print(account.balance);
      print(" ");

    }
  }

  _addAccount() async {
    print("Digite o nome da conta");
    String name = stdin.readLineSync().toString().trim();
    print("Digite o sobrenome da conta");
    String lastname = stdin.readLineSync().toString().trim();
    print("Digite o saldo da conta");
    String balance = stdin.readLineSync().toString().trim();

    Account account = Account(
      id: DateTime.now().toString(),
      name: name,
      lastname: lastname,
      balance: balance,
    );

    await _accountService.addAccount(account: account);
  }

  void runChatBot() async {
    print("Ola, meu nome é ChatBob, em que posso te ajudar?");
    print("Fico feliz em ter voce aqui conosco, o que deseja fazer?");
    bool isRunning = true;
    while (isRunning) {
      print("1 - Listar contas");
      print("2 - Adicionar conta");
      print("3 - Sair");
      String? option = stdin.readLineSync().toString().trim();
      if (option.isEmpty) {
        print("Nao entendi, pode repetir, por favor");
      } else if (option == "1") {
        await _getAllAccounts();
        continue;
      } else if (option == "2") {
        await _addAccount();
        continue;
      } else if (option == "3") {
        isRunning = false;
      } else {
        print("Opção inválida");
      }
    }
  }
}
