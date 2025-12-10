import 'package:clean_bookly/Features/home/presentation/views/widgets/best_seller_book_item.dart';
import 'package:clean_bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:clean_bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewResults extends StatelessWidget {
  const SearchViewResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BestSellerBookItem(bookModel: state.books[index]);
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchInitial) {
          return const Center(child: Text('Search for a Book'));
        } else {
          return const Center(
            child: SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }
      },
    );
  }
}
