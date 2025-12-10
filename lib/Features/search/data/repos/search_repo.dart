import 'package:clean_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String category,
  });
}
