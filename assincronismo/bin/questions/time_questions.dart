import 'dart:io';


//implementar o Timing!

class TimeQuestions{
  String hour = 'Que horas sao?';
  String day = 'Que dia e hoje?';
  String year = 'Em que ano estamos?';
  String question;
  DateTime date = DateTime.now();
  String kakoBot = 'KakoBOT:\n';
  bool isThisATimeQuestion = false;

  TimeQuestions(this.question);

  bool isThisTime(){
    //verificar se estamos numa pergunta sobre Tempo
    if (question.contains('horas') ||
        question.contains('Horas') ||
        question.contains('dia') ||
        question.contains('Dia') ||
        question.contains('ano') ||
        question.contains('Ano')) {
      isThisATimeQuestion = true;
    }
    return isThisATimeQuestion;
  }

  timeQuestion() {

    if (question == hour) {

      String botAnswer = '$kakoBot Opa! são : ${date.hour} horas e ${date.minute} minutos!';
      print(botAnswer);
    } else if (question == day) {

      String botAnswer = '$kakoBot Opa! hoje é dia : ${date.day}';
      print(botAnswer);
    } else if (question == year) {

      String botAnswer = '$kakoBot Opa! estamos em : ${date.year}';
      print(botAnswer);
    } else {
      unsure();
    }
  }

  unsure() {
    if (question.contains('horas') || question.contains('Horas')) {

      String botQuestion =
          '$kakoBot Não entendi, você quer saber das horas?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {

        String botAnswer = '$kakoBot Beleza, são : ${date.hour} horas e ${date.minute} minutos!';
        print(botAnswer);
      } else {

        String botAnswer = '$kakoBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('dia') || question.contains('Dia')) {

      String botQuestion =
          '$kakoBot Não entendi, você quer saber que dia é hoje?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {

        String botAnswer = '$kakoBot Beleza, hoje é dia: ${date.day}';
        print(botAnswer);
      } else {

        String botAnswer = '$kakoBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    } else if (question.contains('ano') || question.contains('Ano')) {

      String botQuestion =
          '$kakoBot Não entendi, você quer saber em que ano estamos?';
      print(botQuestion);
      String answer = stdin.readLineSync().toString();
      if (answer.contains('Sim') || answer.contains('sim')) {

        String botAnswer = '$kakoBot Beleza, estamos no ano de 2077, a pandemia já está terminando... \n Brincadeirinha! estamos em : ${date.year}';
        print(botAnswer);
      } else {

        String botAnswer = '$kakoBot Ah, foi mal... entendi errado.';
        print(botAnswer);
      }
    }
  }
}
