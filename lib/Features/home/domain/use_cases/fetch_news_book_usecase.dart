import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:clean_bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBookUsecase {
  final HomeRepo homeRepo;

  FetchNewsBookUsecase({required this.homeRepo});

  Future<Either<Failure, List<BookEntity>>> call() {
    //check permission

    return homeRepo.fetchNewsBooks();
  }
}
