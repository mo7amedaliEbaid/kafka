part of 'book_cubit.dart';

class BooksRepository {
  Future<List<Book>> fetchApi() =>
      BooksDataProvider.fetch();

  Future<List<Book>?> fetchHive() =>
      BooksDataProvider.fetchHive();
}
