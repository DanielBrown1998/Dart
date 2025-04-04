import 'account_service.dart';
import 'package:assincronismo/models/account.dart';
import 'package:assincronismo/models/transaction.dart';
import 'dart:core';

class TrnasactionService {
  AccountService accountService = AccountService();

  Future<void> makeTransaction(
      {required String idSender,
      required String idReceiver,
      required double amount}) async {
    List<Account> accounts = await accountService.getAll();

    if (accounts.isEmpty) {
      print('No accounts found');
      return;
    }
    if (idSender == idReceiver) {
      print('Sender and receiver accounts cannot be the same');
      return;
    }
    if (amount <= 0) {
      print('Invalid amount');
      return;
    }

    Account? idSenderAccount =
        accounts.firstWhere((element) => element.id == idSender);

    Account? idReceiverAccount =
        accounts.firstWhere((element) => element.id == idReceiver);

    double tax = Transaction.calculateTaxesByAccount(idSenderAccount, amount);

    Transaction transaction = Transaction(
        id: id,
        amount: amount,
        receiverAccountId: idReceiver,
        senderAccountId: idSender,
        taxes: tax,
        date: DateTime.now());

    print('Transaction created');
  }

  Future<void> getTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    print('Transaction retrieved');
  }

  Future<void> updateTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    print('Transaction updated');
  }

  Future<void> deleteTransaction() async {
    await Future.delayed(const Duration(seconds: 2));
    print('Transaction deleted');
  }
}
