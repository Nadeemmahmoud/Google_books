abstract class EndPoints {
  static const String baserUrl = "https://www.googleapis.com/books/v1/";
  static const String fetchBooks =
      "volumes?Filtering=free-ebooks&q=subject:math";
  static const String fetchNewBooks =
      "volumes?Filtering=free-ebooks&sorting-newsest &q=subject:computer science";
}

abstract class ApiKey {
  static String id = "id";
}
