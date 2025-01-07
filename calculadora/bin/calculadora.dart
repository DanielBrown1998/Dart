import 'package:calculadora/calculadora.dart';
import 'dart:io';

void main() {
  print('Digite um número->');
  dynamic numUm = stdin.readLineSync()!;
  while (numUm == null || numUm == "" || numUm == " ") {
    print('Digite um número válido->');
    numUm = stdin.readLineSync();
  }
  numUm = double.parse(numUm);

  List<String> operacoes = ["+", "-", "*", "/"];
  print("Digite alguma das operações ${operacoes.toString()} ->");
  String? operacao = stdin.readLineSync();
  while (operacao != null && !operacoes.contains(operacao)) {
    print('Digite uma operação válida->');
    operacao = stdin.readLineSync();
  }
  print("Digite outro número->");
  dynamic numDois = stdin.readLineSync();
  while (numDois == null || numDois == "" || numDois == " ") {
    print('Digite um número válido->');
    numDois = stdin.readLineSync();
  }
  numDois = double.parse(numDois);

  switch (operacao) {
    case '+':
      print("A soma é: ${Calculadora.soma(numUm, numDois)}");
      break;
    case '-':
      print("A subtração é: ${Calculadora.subtracao(numUm, numDois)}");
      break;
    case '*':
      print(
          "A multiplicação é: ${Calculadora.multiplicacao(numUm, numDois)}");
      break;
    case '/':
      try {
        print("A divisão é: ${Calculadora.divisao(numUm, numDois)}");
        break;
      } catch (e) {
        print("Erro: $e");
      }
  }
  
}
