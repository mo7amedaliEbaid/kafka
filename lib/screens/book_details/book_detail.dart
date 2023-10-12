import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kafka/models/book_model.dart';

import '../../configs/app.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;

  const BookDetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            padding: Space.all(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Space.y!,
                Text(
                  book.title ?? "",
                  style: AppText.h1b,
                ),
                Space.y!,
                book.imageLinks == null
                    ? Center(child: Text("No Details Available"))
                    : CachedNetworkImage(
                        imageUrl: book.imageLinks!,
                        errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              size: 50,
                            ),
                        placeholder: (context, string) {
                          return Icon(
                            Icons.change_circle_sharp,
                            size: 50,
                          );
                        }),
                Space.y1!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      book.authors ?? "",
                      style: AppText.b2b,
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  book.description ?? "",
                )
              ],
            )),
      ),
    );
  }
}
