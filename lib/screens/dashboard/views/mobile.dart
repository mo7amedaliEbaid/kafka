part of '../dashboard.dart';

class DashboardMobile extends StatelessWidget {
  const DashboardMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    Future<bool> _onWillPop() async {
      return (await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                "Exit Application",
              ),
              content: const Text(
                "Are You Sure?",
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: const Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<BooksCubit, BooksState>(
              builder: (context, state) {
                if (state is BooksFetchLoading) {
                  return Column(
                    children: [
                      for (int i = 0; i < 3; i++) const _ShimmerBookCard()
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
                                          BookDetailScreen(book: book)));
                                },
                                child: BookCard(
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
          ),
        ),
      ),
    );
  }
}
