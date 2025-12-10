import 'package:clean_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:clean_bookly/Features/home/presentation/views/widgets/book_list_item.dart';
import 'package:clean_bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:clean_bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerBookItem extends StatelessWidget {
  const BestSellerBookItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookDetailsView', extra: bookModel);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: SizedBox(
          height: 115,
          child: Row(
            children: [
              BookListItem(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(width: 25),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        bookModel.volumeInfo?.title ?? 'no title',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      bookModel.volumeInfo?.authors?[0] ?? 'Unknown author',
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          r'Free',
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const BookRating(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
