part of 'quote_cubit.dart';



class QuotesDataProvider {
  static final dio = Dio();


  static final cache = Hive.box('quotesbox');
  static final appCache = Hive.box('app');

  static Future<List<Quote>> fetch() async {
    log("start fetching quotessssssssssssssssssss");
    try {
      final response = await dio.post(
          'https://quotel-quotes.p.rapidapi.com/search',
          data: {
            "pageSize": 25,
            "page": 0,
            "searchString": 'Franz Kafka'
          },
          options: Options(
            headers: {
              'content-type': 'application/json',
              'X-RapidAPI-Key': MyQuotesApiKey,  // Api key is required get it from https://rapidapi.com/skjaldbaka17/api/quotel-quotes
              'X-RapidAPI-Host': 'quotel-quotes.p.rapidapi.com'
            },
          )
      );

      List rawlist = response.data;

      log("logging raw quotes................");
      log(rawlist.toString());



      List<Quote> quotes = List.generate(
        rawlist.length,
            (index) =>
            Quote.fromMap(
              rawlist[index],
            ),
      );

      log("logging quotes..................");
      log(quotes.toString());

      await cache.put("quotes", quotes);
      await appCache.put('quotesTime', DateTime.now());

      return quotes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Quote>?> fetchHive() async {
    try {
      List? cachedQuote = cache.get("quotes");

      if (cachedQuote == null) return null;

      List<Quote>? quote = List.generate(
        cachedQuote.length,
            (index) => cachedQuote[index],
      );
      return quote;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
