import 'package:clean_bookly/Features/home/presentation/manager/news_books/new_books_cubit.dart';
import 'package:clean_bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBooksBlocCuliderListView extends StatelessWidget {
  const NewBooksBlocCuliderListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBooksCubit, NewBooksState>(
      builder: (context, state) {
        if (state is NewBooksSuccess) {
          return BestSellerListView(books: state.books,);
        } else if (state is NewBooksFailure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
