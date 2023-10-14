part of 'book_cubit.dart';

class BooksRepository {
  Future<List<Book>> fetchApi(String keyword) =>
      BooksDataProvider.fetch(keyword);

  Future<List<Book>?> fetchHive(String keyword) =>
      BooksDataProvider.fetchHive(keyword);
}
