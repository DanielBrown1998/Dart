import 'dart:io';

import 'questions/time_questions.dart';
import 'waiting_time.dart';
import 'questions/good_manners.dart';
import 'questions/math_bot.dart';

void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  print('-- Iniciando o KakoBOT, aguarde..--');
//980229178
  await BotClock().wait(2);
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  var myStream = BotClock().kakoBotStream(1,15);
  var subscription = myStream.listen((value){
    print('.');
  }, onDone: () {
    print('KakoBOT: Stream finalizada por esgotamento de recursos!');
    a = false;
  });
  do {
    subscription.resume();
    print("aqui->");
    usuario = stdin.readLineSync().toString();
    subscription.pause(Future.delayed(Duration(seconds: 3)));
    print('-- Processando pergunta, aguarde..--');
    await BotClock().wait(3);

    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      subscription.cancel();
      print('$kakoBot Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
      // ignore: dead_code
    } else if (MathBot(usuario).containsMathExpression()) {
      await BotClock().wait(2);
      MathBot(usuario).executeMathExpression();
      //Basta adicionar novas perguntas aqui!
    } else {
      await BotClock().wait(3);
      print(
          '$kakoBot Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print('$kakoBot Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);
  print('--Encerrando KakoBOT--');
  await BotClock().wait(3);
  print('--KakoBOT Encerrado--');
}
