class Calculadora {
  static double soma(double numUm, double numDois) {
    return numUm + numDois;
  }
  static double subtracao(double numUm, double numDois) {
    return numUm - numDois;
  }
  static double multiplicacao(double numUm, double numDois) {
    return numUm * numDois;
  }
  static double divisao(double numUm, double numDois) {
    if (numDois == 0) {
      throw Exception('Divisão por zero');
    }
    return numUm / numDois;
  }
}