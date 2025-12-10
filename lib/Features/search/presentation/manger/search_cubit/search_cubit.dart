import 'package:clean_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_bookly/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> searchBooks({required String category}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(category: category);
    result.fold(
      (failure) => emit(SearchFailure(failure.toString())),
      (books) => emit(SearchSuccess(books)),
    );
  }
}
