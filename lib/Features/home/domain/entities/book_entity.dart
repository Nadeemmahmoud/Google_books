import 'package:hive/hive.dart';

part 'book_entity.g.dart'; // Generated file (don't forget this)

@HiveType(typeId: 0) // Each model needs a unique typeId
class BookEntity {
  @HiveField(0)
  final String image;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String authorName;

  BookEntity({
    required this.image,
    required this.title,
    required this.authorName,
  });
}
