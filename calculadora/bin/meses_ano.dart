import 'dart:io';

Map<int, String> mesesAno = {
  1: 'Janeiro',
  2: 'Fevereiro',
  3: 'Março',
  4: 'Abril',
  5: 'Maio',
  6: 'Junho',
  7: 'Julho',
  8: 'Agosto',
  9: 'Setembro',
  10: 'Outubro',
  11: 'Novembro',
  12: 'Dezembro'
};
void main() {
  String opc = '';

  while (opc != 's') {
    print("Digite 's' para sair a qualquer instante");
    print("Digite de 1 a 12 para buscar os respectivos meses");
    stdout.write("->");
    opc = stdin.readLineSync()!;
    if (opc != 's') {
      int? mes = int.tryParse(opc);
      if (mes != null && mesesAno.containsKey(mes)) {
        print("O mês escolhido foi ${mesesAno[mes]}");
      }
    } else {
      print("Saindo...");
    }
  }
}
