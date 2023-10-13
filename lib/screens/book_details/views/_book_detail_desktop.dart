part of '../book_details.dart';

class DesktopBookDetailScreen extends StatelessWidget {
  final Book book;

  const DesktopBookDetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Padding(
        padding: Space.vf(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      book.title ?? "",
                      style: AppText.h2b,
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Space.y2!),

                  Flexible(
                    flex: 20,
                    child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        height: AppDimensions.normalize(200),
                        imageUrl: book.imageLinks!,
                        errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              size: AppDimensions.normalize(10),
                            ),
                        placeholder: (context, string) {
                          return Icon(
                            Icons.change_circle_sharp,
                            size: AppDimensions.normalize(10),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Space.xf(10)),
            Flexible(
              flex: 6,
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      book.publishedDate ?? "",
                      style: AppText.h2b,
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Space.y1!),
                  Flexible(
                    flex: 20,
                    child: SizedBox(
                      height: AppDimensions.normalize(250),
                      width: AppDimensions.normalize(200),
                      child: Text(
                        book.description ?? "",
                        style: AppText.b1b,
                        maxLines: 50,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
