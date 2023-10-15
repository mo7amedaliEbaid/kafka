
part of '../../dashboard.dart';

class _BookCard extends StatelessWidget {
  final Book book;

  const _BookCard({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Card(
      elevation: 5,
      child: Container(
        width: AppDimensions.normalize(70),
        height: AppDimensions.normalize(120),
        padding: Space.all(0.5, 1),
        decoration: BoxDecoration(
          color: AppTheme.c!.background,
          borderRadius: BorderRadius.circular(
            AppDimensions.normalize(6),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 12,
              spreadRadius: 6.0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
                width: AppDimensions.normalize(85),
                height: AppDimensions.normalize(85),
                padding: Space.all(.7,.7),
                decoration: BoxDecoration(
                  color:  Colors.grey[200],
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(6),
                  ),
                ),
                child: CachedNetworkImage(imageUrl: book.imageLinks!,fit: BoxFit.fill,),),
            Space.y1!,
            Text(
              book.title!,
              style: AppText.b1b,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
