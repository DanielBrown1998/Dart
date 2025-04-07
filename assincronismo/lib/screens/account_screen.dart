import 'dart:io';
import 'package:assincronismo/exceptions/amount_exception.dart';
import 'package:assincronismo/exceptions/receiver_exception.dart';
import 'package:assincronismo/exceptions/sender_exception.dart';
import 'package:assincronismo/exceptions/transaction_exception.dart';
import 'package:assincronismo/models/account.dart';
import "package:assincronismo/services/account_service.dart";
import 'package:http/http.dart';
import 'package:assincronismo/services/transaction_service.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();
  TransactionService transactionService = TransactionService();

  void initializerStream() {
    _accountService.stream.listen(
      (event) {
        print(event);
      },
    );
  }

  _maketransaction(String idSender, String idReceiver, double amount) async {
    try {
      await transactionService.makeTransaction(
          idSender: idSender, idReceiver: idReceiver, amount: amount);
    } on ReceiverException catch (e) {
      print("Erro: ${e.message}");
    } on SenderException catch (e) {
      print("Erro: ${e.message}");
    } on TransactionException catch (e) {
      print("Erro: ${e.message}");
    } on AmountException catch (e) {
      print("Erro: ${e.message}");
    }
  }

  _getAllAccounts() async {
    try {
      List<Account> accounts = await _accountService.getAll();
      for (Account account in accounts) {
        print(account.id);
        print(account.name);
        print(account.lastname);
        print(account.balance);
        print(account.accountType);
        print(" ");
      }
    } on ClientException catch (error) {
      print("servidor nao encontrado!");
      print(error.message);
      print(error.uri);
    } on Exception catch (error) {
      print("Houve um erro");
      print(error.toString());
    } finally {
      print("${DateTime.now()} | Ocorreu uma tentativa de consulta!");
    }
  }

  _addAccount() async {
    print("Digite o nome da conta");
    String name = stdin.readLineSync().toString().trim();
    print("Digite o sobrenome da conta");
    String lastname = stdin.readLineSync().toString().trim();
    print("Digite o saldo da conta");
    String balance = stdin.readLineSync().toString().trim();
    print("Digite o tipo da conta");
    String accountType = stdin.readLineSync().toString().trim();

    Account account = Account(
        id: DateTime.now().toString(),
        name: name,
        lastname: lastname,
        balance: balance,
        accountType: accountType);

    await _accountService.addAccount(account: account);
  }

  void runChatBot() async {
    print("Ola, meu nome é ChatBob, em que posso te ajudar?");
    print("Fico feliz em ter voce aqui conosco, o que deseja fazer?");
    bool isRunning = true;
    while (isRunning) {
      print("1 - Listar contas");
      print("2 - Adicionar conta");
      print("3 - Efetuar uma transacao");
      print("4 - Sair");
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
        List<String> questions = [
          "digite o id do emissor",
          "digite o id do recebedor",
          "digite o valor",
        ];
        List<dynamic> values = [];
        int i = 0;
        for (String q in questions) {
          print(q);
          String? option = stdin.readLineSync().toString().trim();
          if (i == 2) {
            values.add(double.tryParse(option));
            break;
          } else {
            values.add(option);
          }
          i++;
        }
        await _maketransaction(values[0], values[1], values[2]);
      } else if (option == "4") {
        isRunning = false;
      } else {
        print("Opção inválida");
      }
    }
  }
}
