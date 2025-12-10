import 'package:clean_bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:clean_bookly/Features/search/presentation/views/widgets/search_view_result_list.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Column(
          children: [
            CustomSearchTextField(),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Search Results',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: SearchViewResults()),
          ],
        ),
      ),
    );
  }
}
