import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/Features/home/domain/use_cases/fetch_featured_books_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUsecase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUsecase featuredBooksUsecase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    try {
      final res = await featuredBooksUsecase.call();
      res.fold(
        (failure) {
          emit(FeaturedBooksFailure(errMessage: failure.errMessage));
        },
        (books) {
          emit(FeaturedBooksSuccess(books: books));
        },
      );
    } catch (e) {
      emit(FeaturedBooksFailure(errMessage: e.toString()));
    }
  }
}
