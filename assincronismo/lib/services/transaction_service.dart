import 'account_service.dart';
import 'package:assincronismo/models/account.dart';
import 'package:assincronismo/models/transaction.dart';
import 'dart:core';
import 'package:assincronismo/exceptions/receiver_exception.dart';
import 'package:assincronismo/exceptions/sender_exception.dart';
import 'package:assincronismo/exceptions/amount_exception.dart';
import 'package:assincronismo/exceptions/transaction_exception.dart';

class TransactionService {
  AccountService accountService = AccountService();

  Future<void> makeTransaction(
      {required String idSender,
      required String idReceiver,
      required double amount}) async {
    List<Account> accounts = await accountService.getAll();
    print(accounts);
    if (accounts.isEmpty) {
      throw TransactionException(message: 'No accounts found');
    }
    if (idSender == idReceiver) {
      throw TransactionException(
          message: 'Sender and receiver accounts cannot be the same');
    }
    if (amount <= 0) {
      throw TransactionException(message: 'Invalid amount');
    }
    if (accounts.where((element) => element.id == idSender).isEmpty) {
      throw SenderException(message: "Nao existe alguem com o id: $idSender");
    }

    Account? idSenderAccount =
        accounts.firstWhere((element) => element.id == idSender);

    if (accounts.where((element) => element.id == idReceiver).isEmpty) {
      throw ReceiverException(
          message: "Nao existe alguem com o id: $idReceiver");
    }

    Account? idReceiverAccount =
        accounts.firstWhere((element) => element.id == idReceiver);

    double tax = Transaction.calculateTaxesByAccount(idSenderAccount, amount);

    double amountTotal = amount + tax;

    if (double.tryParse(idSenderAccount.balance)! < amountTotal) {
      throw AmountException(
          message:
              " O ${idSenderAccount.name} nao possui fundos para essa operacao");
    }

    Transaction transaction = Transaction(
        amount: amount,
        receiverAccountId: idReceiver,
        senderAccountId: idSender,
        taxes: tax,
        date: DateTime.now());

    idSenderAccount.balance =
        (double.tryParse(idSenderAccount.balance)! - (amountTotal)).toString();
    print(idSenderAccount.balance);

    idReceiverAccount.balance =
        (double.tryParse(idReceiverAccount.balance)! + amount)
            .toString();
    print(idReceiverAccount.balance);

    accounts[accounts.indexWhere((element) => element.id == idReceiver)] =
        idReceiverAccount;

    accounts[accounts.indexWhere((element) => element.id == idSender)] =
        idSenderAccount;

    await accountService.updateAccount(idSenderAccount);
    await accountService.updateAccount(idReceiverAccount);

    print('Transaction ${transaction.id} created');
    print("Operacao efetuada com sucesso");
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
