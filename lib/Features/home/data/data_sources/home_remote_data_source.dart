import 'package:clean_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/constants.dart';
import 'package:clean_bookly/core/databases/api/api_consumer.dart';
import 'package:clean_bookly/core/databases/api/end_points.dart';
import 'package:clean_bookly/core/utils/helper/save_books_cache.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}

class HomeRemoteDataSourceimpl extends HomeRemoteDataSource {
  final ApiConsumer apiConsumer;

  HomeRemoteDataSourceimpl({required this.apiConsumer});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var res = await apiConsumer.get(EndPoints.fetchBooks);
    List<BookEntity> books = getBooks(res);
    saveBooks(books, boxName: kFeaturedBooksCache);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var res = await apiConsumer.get(EndPoints.fetchNewBooks);
    List<BookEntity> books = getBooks(res);

    return books;
  }

  List<BookEntity> getBooks(res) {
    List<BookEntity> books = [];
    for (var bookMap in res['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    saveBooks(books, boxName: kNewBookCache);
    return books;
  }
}
