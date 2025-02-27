import 'dart:io';

void main() {
  stdout.write('Введите название книги: ');
  String? nameBook = stdin.readLineSync();
  stdout.write('Введите автора книги: ');
  String? createrBook = stdin.readLineSync();
  stdout.write('Введите год издания книги: ');
  String? dateBook = stdin.readLineSync();
  File file = File('books.txt');
  final books = Directory('books');
  if (file.existsSync()) {
  } else {
    file.createSync();
  }
  file.writeAsStringSync(
      "Название: ${nameBook}, Автор: ${createrBook}, Дата издания: ${dateBook}.\n",
      mode: FileMode.append);
  if (books.existsSync()) {
  } else {
    Directory('books').createSync();
  }
  var stat = file.statSync();
  file.copySync(
      "./books/${stat.changed.toString().replaceAll(' ', '').replaceAll(':', '-').substring(0, 10)}.txt");
  file.deleteSync();
}
