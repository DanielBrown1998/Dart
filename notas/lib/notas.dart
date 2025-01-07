import 'dart:io';

class Notas {
  final Map<String, List<double>> _notas;
  Notas(this._notas) {
    _notas.forEach((aluno, notas) {
    print("$aluno: $notas");
    print("média: ${getMedia(aluno)}");
    print("conceito: ${getConceito(aluno)}");
  print("_________________________");
  });
    listarComandos();
    while (true) {
      print('Digite o comando:');
      var comando = int.parse(stdin.readLineSync()!);
      if (comando == 9) {
        print("Saindo...");
        print("Até mais !!!");
        break;
      }
      switch (comando) {
        case 1:
          print('Digite o nome do aluno:');
          var aluno = stdin.readLineSync()!;
          adicionarAluno(aluno);
          break;
        case 2:
          print('Digite o nome do aluno:');
          var aluno = stdin.readLineSync()!;
          print('Digite a nota:');
          var nota = double.parse(stdin.readLineSync()!);
          adicionarNota(aluno, nota);
          break;
        case 3:
          print('Digite o nome do aluno:');
          var aluno = stdin.readLineSync()!;
          try{
            removerAluno(aluno);
          }catch (e){
            print("Error: $e");
          }
          break;
        case 4:
          print('Digite o nome do aluno:');
          var aluno = stdin.readLineSync()!;
          while (!buscarAluno(aluno)) {
            print('Aluno não encontrado');
            print('nome do aluno, novamente:');
            aluno = stdin.readLineSync()!;
          }
          print('Digite a nota:');
          var nota = double.parse(stdin.readLineSync()!);
          removerNota(aluno, nota);
          break;
        case 5:
          listarAlunos();
          break;
        case 6:
          listarNotas();
          break;
        case 7:
          listarMedias();
          break;
        case 8:
          listarConceitos();
          break;
        default:
          print('Comando inválido');
      }
    }
  }

  Map<String, List<double>> get notas => _notas;

  bool buscarAluno(String aluno) {
    return _notas.containsKey(aluno);
  }

  List<double> getNota(String aluno) {
    if (!_notas.containsKey(aluno)) {
      throw Exception('Materia não encontrada');
    }
    return _notas[aluno]!;
  }

  double getMedia(String aluno) {
    var notas = getNota(aluno);
    var total = notas.reduce((a, b) => a + b);
    return total / notas.length;
  }

  String getConceito(String aluno) {
    var media = getMedia(aluno);
    if (media >= 9) {
      return 'A';
    } else if (media >= 7) {
      return 'B';
    } else if (media >= 5) {
      return 'C';
    } else if (media >= 3) {
      return 'D';
    } else {
      return 'E';
    }
  }

  void adicionarNota(String aluno, double nota) {
    if (!_notas.containsKey(aluno)) {
      _notas[aluno] = [];
    }
    _notas[aluno]!.add(nota);
  }

  void removerNota(String aluno, double nota) {
    if (!_notas.containsKey(aluno)) {
      throw Exception('Aluno não encontrado');
    }
    _notas[aluno]!.remove(nota);
  }

  void removerAluno(String aluno) {
    if (!_notas.containsKey(aluno)) {
      throw Exception('Aluno não encontrado');
    }
    _notas.remove(aluno);
  }

  void adicionarAluno(String aluno) {
    if (_notas.containsKey(aluno)) {
      throw Exception('Aluno já existe');
    }
    _notas[aluno] = [];
  }

  void listarComandos() {
    print('Comandos:');
    print('1 - Adicionar aluno');
    print('2 - Adicionar nota');
    print('3 - Remover aluno');
    print('4 - Remover nota');
    print('5 - Listar alunos');
    print('6 - Listar notas');
    print('7 - Listar médias');
    print('8 - Listar conceitos');
    print('9 - Sair');
  }

  void listarAlunos() {
    print("Alunos");
    notas.forEach((aluno, notas) {
      print(aluno);
    });
  }

  void listarNotas() {
    print("Notas");
    notas.forEach((aluno, notas) {
      print("$aluno: $notas");
    });
  }

  void listarMedias() {
    print("médias");
    _notas.forEach((alunos, notas) {
      print("$alunos: ${getMedia(alunos)}");
    });
  }

  void listarConceitos() {
    print("Conceitos");
    _notas.forEach((alunos, notas) {
      print("$alunos: ${getConceito(alunos)}");
    });
  }
}
