import 'dart:io';

void main() {
  List<String> notas = <String>[];

  menu(notas);
}

String getComando() {
  print('Digite um comando: 1 - Adicionar nota, 2 - Listar nota, 3 - Sair');
  List<String> comandos = <String>['1', '2', '3'];
  String? entrada = '';

  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)) {
    print('Comando inválido!');

    getComando();
  }

  return entrada!;
}

List<String> adicionaNota(List<String> notas) {
  print('Escreva uma nota:');
  String? nota = stdin.readLineSync();

  if (nota == null || nota.isEmpty) {
    print('Não é possível adicionar uma nota vazia');
    adicionaNota(notas);
  }

  notas.add(nota!);

  return notas;
}

void listarNotas(List<String> notas) {
  if (notas.isEmpty) {
    print('Não há notas para listar');
  }

  for (int i = 0; i < notas.length; i++) {
    print('Nota ${i + 1}: ${notas[i]}');
  }
}

void menu(List<String> notas) {
  print('');
  cabecalho();
  print('');
  String comando = getComando();
  print('');

  switch (comando) {
    case '1':
      adicionaNota(notas);
      menu(notas);
      break;

    case '2':
      listarNotas(notas);
      menu(notas);
      break;

    case '3':
      print('Saindo...');
      break;
  }
}

void cabecalho() {
  print(" _        _______ _________ _______ ");
  print("( (    /|(  ___  )\\__   __/(  ____ \\");
  print("|  \\  ( || (   ) |   ) (   | (    \\/");
  print("|   \\ | || |   | |   | |   | (__    ");
  print("| (\\ \\) || |   | |   | |   |  __)   ");
  print("| | \\   || |   | |   | |   | (      ");
  print("| )  \\  || (___) |   | |   | (____/\\");
  print("|/    )_)(_______)   )_(   (_______/");
  print("                                    ");
}
