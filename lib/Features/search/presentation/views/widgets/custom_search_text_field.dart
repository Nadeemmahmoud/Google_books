import 'package:clean_bookly/Features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    void triggerSearch() {
      final query = controller.text.trim();
      if (query.isNotEmpty) {
        BlocProvider.of<SearchCubit>(context).searchBooks(category: query);
      }
    }

    return TextField(
      controller: controller,
      onSubmitted: (_) => triggerSearch(),
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),

        suffixIcon: IconButton(
          onPressed: triggerSearch,
          icon: const Icon(Icons.search),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
