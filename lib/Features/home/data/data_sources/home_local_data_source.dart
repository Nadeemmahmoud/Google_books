import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBooksCache);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsBooks() {
    var box = Hive.box<BookEntity>(kNewBookCache);
    return box.values.toList();
  }
}
