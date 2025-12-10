import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooks(List<BookEntity> books, {required String boxName}) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
