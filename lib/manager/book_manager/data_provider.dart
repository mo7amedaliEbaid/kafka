part of 'book_cubit.dart';

class BooksDataProvider {
  static final dio = Dio();


  static final cache = Hive.box('booksbox');
  static final appCache = Hive.box('app');

  static Future<List<Book>> fetch() async {
    try {
      final response = await dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=inauthor:"Franz+Kafka"&maxResults=40',
      );

      Map raw = response.data;

      log("logging raw ................");
      log(raw.toString());

     List itemslist=raw['items'];

     log("logging big list lenght.............................");
     log(itemslist.length.toString());

      List booksList = [];

      for(int i=0; i<itemslist.length; i++){
        booksList.add(itemslist[i]['volumeInfo']);
      }

      log("Logging booklist.......................");
      log(booksList.toString());

      List<Book> books = List.generate(
        booksList.length,
        (index) => Book.fromMap(
          booksList[index],
        ),
      );

      log("logging books..................");
      log(books.toString());

      await cache.put("books", books);
      await appCache.put('booksTime', DateTime.now());

      return books;

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Book>?> fetchHive() async {
    try {
      List? cachedBook = cache.get("books");

      if (cachedBook == null) return null;
 
      List<Book>? book = List.generate(
        cachedBook.length,
        (index) => cachedBook[index],
      );
      return book;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
