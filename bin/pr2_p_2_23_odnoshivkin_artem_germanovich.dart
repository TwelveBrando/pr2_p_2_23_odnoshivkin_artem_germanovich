import 'dart:io';

void main() {
  stdout.write('Введите название книги: ');
  String? nameBook = stdin.readLineSync(); // null может быть - ?
  stdout.write('Введите автора книги: ');
  String? createrBook = stdin.readLineSync(); // null может быть - ?
  stdout.write('Введите год издания книги: ');
  String? dateBook = stdin.readLineSync(); // null может быть - ?
  File file = File('books.txt');
  final books = Directory('books');
  if (file.existsSync()) {
  } else {
    file.createSync();
  }
  file.writeAsStringSync(
      "Название: ${nameBook}, Автор: ${dateBook}, Дата издания: ${dateBook}.\n",
      mode: FileMode.append);
  if (books.existsSync()) {
  } else {
    Directory('books').createSync();
  }
  var stat = file.statSync();

  file.renameSync(
      "./books/${stat.changed.toString().replaceAll(' ', '').replaceAll(':', '-')}.txt");
}
