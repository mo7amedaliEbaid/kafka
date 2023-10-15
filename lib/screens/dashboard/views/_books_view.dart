part of '../dashboard.dart';

class _BooksView extends StatelessWidget {
  const _BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BooksFetchLoading) {
            return Wrap(
              children: [
                for (int i = 0; i < 10; i++) const _ShimmerBookCard()
              ],
            );
          } else if (state is BooksFetchFailed) {
            return Text(state.message!);
          } else if (state is BooksFetchSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: Space.v1!,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: state.data!
                      .map(
                        (book) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                BookDetails(book: book)));
                      },
                      child: _BookCard(
                        book: book,
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            );
          } else {
            return const Text('Something Went Wrong!');
          }
        },
      ),
    );
  }
}