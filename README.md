# kafka

A flutter Multi Platform project for the novels and quotes of [Franz_Kafka](https://en.wikipedia.org/wiki/Franz_Kafka)

- Multi Platform (Mobile `Android`,`Ios`, Tablet, Web, Desktop `Linux`)
- Multiple themes
- Responsive Design (Portrait, Landscape, Tablet, Desktop)
- Clean Architecture
- Books Api => Dio
- Quotes Api => Dio
- Data Caching => Hive
- Cubits
- Providers
- Books View
- Quotes View
- Loading Shimmer
- Details Screen
- Firebase hosting

## Remarks
- For the books api [Here](https://developers.google.com/books/docs/v1/using) It doesn't require an api key just put https://www.googleapis.com/books/v1/volumes?q=inauthor:"Franz+Kafka"&maxResults=40 in dio get method and you can change the author name or search books by any keyword.
```dart
 final response = await dio.get(
        'https://www.googleapis.com/books/v1/volumes?q=inauthor:"Franz+Kafka"&maxResults=40',
      );
```
- For the quotes api [Here](https://rapidapi.com/skjaldbaka17/api/quotel-quotes) the `api key` is required in this case you can get your key from [Rapid_Api](https://rapidapi.com/hub). You can change the post request body as it suits your usage.
```dart
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
```
- Run flutter pub run build_runner build command in your terminal to generate book_model.g and quote_model.g
- Run flutter build web --web-renderer html --release in your terminal instead of flutter build web if you have problems in web release.
- for testing your web release you can use firebase hosting it's free.

## Web Demo
Visit Website from here  [Web_Demo](https://e-branch-804fb.web.app/)

## Download Apk
<a href="https://github.com/mo7amedaliEbaid/kafka/releases/download/v1.0.0/kafka.apk"><img src="https://playerzon.com/asset/download.png" width="120"></img></a>

## Demo Video
<a href="https://youtu.be/cN_zJpEqolI?si=8LVEIAq7sqeksW3X"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/2560px-Logo_of_YouTube_%282015-2017%29.svg.png" width="120"></img></a>

## Screenshots.
Fore more screen shots [Here](https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots)


#### creating book_model.g.dart

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/g_models/g_book_model.png" width="670" />
</p>

#### creating quote_model.g.dart

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/g_models/g_quote_model.png" width="670" />
</p>


#### Widget Tree.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4683b58311f53c1bd9511868aa7f990d966eb58b/screenshots/inspector/inspector.png" width="670" />
</p>

### mobile 

#### Portrait.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/mobile/books.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/mobile/books_dark.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/mobile/details.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/mobile/quotes.jpg" width="170" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/mobile/quotes_dark.jpg" width="170" />
</p>

#### Landscape.

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/c061bb305df387fd6865493f804b0bc85ee92a73/screenshots/landscape/land_dark.jpg" width="470" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/c061bb305df387fd6865493f804b0bc85ee92a73/screenshots/landscape/land_quotes.jpg" width="470" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/c061bb305df387fd6865493f804b0bc85ee92a73/screenshots/landscape/landscape_details.jpg" width="470" />
</p>

## Linux

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/eccc8d78d43795d9d536bdd6801d9312c11433b9/screenshots/linux/details_linux.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/eccc8d78d43795d9d536bdd6801d9312c11433b9/screenshots/linux/quotes_linux.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/eccc8d78d43795d9d536bdd6801d9312c11433b9/screenshots/linux/dash_linux.png" width="670" />
</p>

## web

<p float="left">
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/web/books.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/web/books_dark.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/web/quotes.png" width="670" />
   <img src="https://github.com/mo7amedaliEbaid/kafka/blob/4f278889f1c58f663ce8c4021d4df28c35986157/screenshots/web/quotes_dark.png" width="670" />
</p>



