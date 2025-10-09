// ENTRADA: Uma lista de logs. Não modifique esta lista.
const logEntries = [
  "[INFO] (ApiService): Request received",
  "[WARNING] (DatabaseService): Connection is slow",
  "[ERROR] (AuthService): User authentication failed",
  "This is a malformed log entry",
  "[INFO] (ApiService): Request processed successfully",
  "[ERROR] (PaymentService): Credit card expired",
  "[INFO] (DatabaseService): Data fetched",
  "[ERROR] (AuthService): Invalid credentials provided",
  "[DEBUG] (ApiService): Payload dump",
];

String formatWord(String word) {
  word = word
      .trim()
      .replaceFirst("[", "")
      .replaceFirst("]", "")
      .replaceFirst("(", "")
      .replaceFirst(")", "");
  return word;
}

List<String>? formatLog(String log) {
  List<String> logSplited = log.split(":");
  List<String> logSplitedFinal = logSplited.first.split(" ");
  logSplitedFinal.add(logSplited.last);
  if (logSplitedFinal.length != 3) {
    return null;
  }
  return logSplitedFinal;
}

Map<String, dynamic> processLogs(List<String> logs) {
  final logCounts = <String, int>{};
  final errorServices = <String>[];

  for (String log in logEntries) {
    List<String>? logDetails = formatLog(log);
    if (logDetails != null) {
      String typeError = formatWord(logDetails.elementAt(1));
      if (logDetails.first.contains("[ERROR]") &&
          !errorServices.contains(typeError)) {
        errorServices.add(typeError);
      }
      String typeInfo = formatWord(logDetails.first);
      if (logCounts.containsKey(typeInfo)) {
        logCounts[typeInfo] = logCounts[typeInfo]! + 1;
        print("true: $typeInfo");
      } else {
        logCounts[typeInfo] = 1;
        print("false: $typeInfo");
      }
    }
  }

  // Estrutura de retorno de exemplo. Substitua com a sua implementação.
  return {'logCounts': logCounts, 'errorServices': errorServices};
}

// Ponto de entrada principal para testar a sua função.
void main() {
  final summary = processLogs(logEntries);

  // Imprime o resultado para verificação.
  print('Contagem de Logs por Nível:');
  (summary['logCounts'] as Map<String, int>).forEach((level, count) {
    print('  $level: $count');
  });

  print('\nServiços com Erros:');
  print('  ${summary['errorServices']}');
}
