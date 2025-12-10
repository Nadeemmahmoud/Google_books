import 'package:clean_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_bookly/Features/search/data/repos/search_repo.dart';
import 'package:clean_bookly/core/databases/api/api_consumer.dart';
import 'package:clean_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiConsumer apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        'volumes?Filtering=free-ebooks&q=subject:$category',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred: ${e.toString()}'));
    }
  }
}
