class GoodManners {
  String question;
  bool isThisGoodManners = false;
  final String  _kakoBot = 'KakoBOT:\n';

  GoodManners(this.question);

  bool isThisManners(){
    if (question.contains('obrigado') ||
        question.contains('Obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigada') ||
        question.contains('por favor') ||
        question.contains('Por favor') ||
        question.contains('por favor') ||
        question.contains('Por favor') ||
        question.contains('desculpe') ||
        question.contains('Desculpe') ||
        question.contains('com licença') ||
        question.contains('Com licença') ||
        question.contains('com licença') ||
        question.contains('Com licença') ||
        question.contains('bom dia') ||
        question.contains('Bom dia') ||
        question.contains('boa tarde') ||
        question.contains('Boa tarde') ||
        question.contains('boa noite') ||
        question.contains('Boa noite') ||
        question.contains('até logo') ||
        question.contains('Até logo') ||
        question.contains('até mais') ||
        question.contains('Até mais') ||
        question.contains('até breve') ||
        question.contains('Até breve') ||
        question.contains('até amanhã') ||
        question.contains('Até amanhã') ||
        question.contains('até a próxima') ||
        question.contains('Até a próxima') ||
        question.contains('até a próxima vez') ||
        question.contains('Até a próxima vez') ||
        question.contains('até a próxima semana') ||
        question.contains('Até a próxima semana') ||
        question.contains('até a próxima vez') ||
        question.contains('Até a próxima vez') ||
        question.contains('até a próxima semana') ||
        question.contains('Até a próxima semana') ||
        question.contains('até a próxima vez') ||
        question.contains('Até a próxima vez') ||
        question.contains('até a próxima semana') ||
        question.contains('Até a próxima semana') ||
        question.contains('até a próxima vez') ||
        question.contains('Até a próxima vez') ||
        question.contains('até a próxima semana') ||
        question.contains('Até a próxima semana') ||
        question.contains('até a próxima vez') ||
        question.contains('Até a próxima vez') ||
        question.contains('até a próxima semana') ||
        question.contains('Até a próxima semana') ||
        question.contains('até a próxima vez')){
      isThisGoodManners = true;
        }
    return isThisGoodManners;
  }

  void goodManners(){
    if (question.contains('Bom dia') || question.contains('bom dia') ){
      print('$_kakoBot Bom dia! Como posso ajudar?');
    } else if (question.contains('Boa tarde') || question.contains('boa tarde') ){
      print('$_kakoBot Boa tarde! Como posso ajudar?');
    } else if (question.contains('Boa noite') || question.contains('boa noite') ){
      print('$_kakoBot Boa noite! Como posso ajudar?');
    } else if (question.contains('até logo') || question.contains('Até logo') ){
      print('$_kakoBot Até logo! Como posso ajudar?');
    } else if (question.contains('até mais') || question.contains('Até mais') ){
      print('$_kakoBot Até mais! Como posso ajudar?');
    } else if (question.contains('até breve') || question.contains('Até breve') ){
      print('$_kakoBot Até breve! Como posso ajudar?');
    } else if (question.contains('até amanhã') || question.contains('Até amanhã') ){
      print('$_kakoBot Até amanhã! Como posso ajudar?');
    } else if (question.contains('até a próxima') || question.contains('Até a próxima') ){
      print('$_kakoBot Até a próxima! Como posso ajudar?');
    } else if (question.contains('até a próxima vez') || question.contains('Até a próxima vez') ){
      print('$_kakoBot Até a próxima vez! Como posso ajudar?');
    } else if (question.contains('até a próxima semana') || question.contains('Até a próxima semana') ){
      print('$_kakoBot Até a próxima semana! Como posso ajudar?');
    } else if (question.contains('obrigado') || question.contains('Obrigado') ){
      print('$_kakoBot De nada! Como posso ajudar?');
    } else if (question.contains('obrigada') || question.contains('Obrigada') ){
      print('$_kakoBot De nada! Como posso ajudar?');
    } else if (question.contains('por favor') || question.contains('Por favor') ){
      print('$_kakoBot Por nada! Como posso ajudar?');
    }
  }
}
