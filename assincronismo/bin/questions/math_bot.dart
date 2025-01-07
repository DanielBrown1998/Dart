
class MathBot {
  String expression = '';

  MathBot(this.expression);

  int add(int a, int b) {
    return a + b;
  }

  int subtract(int a, int b) {
    return a - b;
  }

  int multiply(int a, int b) {
    return a * b;
  }

  String divide(int a, int b) {
    try {
      return (a / b).toString();
    } on IntegerDivisionByZeroException {
      return 'Não existe divisão por zero';
    } catch (e) {
      return 'Não foi possível realizar a divisão';
    }
  }

  bool containsMathExpression() {
    return expression.contains('+') ||
        expression.contains('-') ||
        expression.contains('*') ||
        expression.contains('/');
  }

  void executeMathExpression(){
    if (expression.contains('+')) {
      var numbers = expression.split('+');
      print(
          "${numbers[0]} + ${numbers[1]} é ${add(int.parse(numbers[0]), int.parse(numbers[1])).toString()}");
    } else if (expression.contains('-')) {
      var numbers = expression.split('-');
      print(
          "${numbers[0]} - ${numbers[1]} é ${subtract(int.parse(numbers[0]), int.parse(numbers[1])).toString()}");
    } else if (expression.contains('*')) {
      var numbers = expression.split('*');
      print(
          "${numbers[0]} * ${numbers[1]} é ${multiply(int.parse(numbers[0]), int.parse(numbers[1])).toString()}");
    } else if (expression.contains('/')) {
      var numbers = expression.split('/');
      print(
          " ${numbers[0]} / ${numbers[1]} é  ${divide(int.parse(numbers[0]), int.parse(numbers[1]))}");
    } else {
      print('Não foi possível realizar a operação');
    }
  }
}
