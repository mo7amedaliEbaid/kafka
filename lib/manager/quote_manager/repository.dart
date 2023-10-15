part of 'quote_cubit.dart';


class QuotesRepository {
  Future<List<Quote>> fetchApi() =>
      QuotesDataProvider.fetch();

  Future<List<Quote>?> fetchHive() =>
      QuotesDataProvider.fetchHive();
}
