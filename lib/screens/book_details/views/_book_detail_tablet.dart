
part of '../book_details.dart';

class TabletBookDetailScreen extends StatelessWidget {
  final Book book;

  const TabletBookDetailScreen({
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
                  style: AppText.h2b,
                ),
                Space.y!,
                CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    height: AppDimensions.normalize(100),
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
                      book.publishedDate ?? "",
                      style: AppText.b2b,
                    ),
                  ],
                ),
                Space.y1!,
                Text(
                  book.description ?? "",
                  style: AppText.b2b,
                )
              ],
            )),
      ),
    );
  }
}
