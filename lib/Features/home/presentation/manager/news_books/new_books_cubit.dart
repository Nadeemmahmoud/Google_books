import 'package:clean_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly/Features/home/domain/use_cases/fetch_news_book_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_books_state.dart';

class NewBooksCubit extends Cubit<NewBooksState> {
  NewBooksCubit(this.fetchNewsBookUsecase) : super(NewBooksInitial());
  final FetchNewsBookUsecase fetchNewsBookUsecase;

  Future<void> fetchNewBooks() async {
    emit(NewBooksLoading());
    var res = await fetchNewsBookUsecase.call();
    res.fold(
      (failure) => emit(NewBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(NewBooksSuccess(books: books)),
    );
  }
}
