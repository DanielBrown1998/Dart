import 'package:assincronismo/screens/account_screen.dart';

void main() {
  AccountScreen accountScreen = AccountScreen();
  accountScreen.initializerStream();
  accountScreen.runChatBot();
}
