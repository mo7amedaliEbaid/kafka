part of '../dashboard.dart';

class _QuotesView extends StatelessWidget {
  const _QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<QuotesCubit, QuotesState>(
        builder: (context, state) {
          if (state is QuotesFetchLoading) {
            return Wrap(
              children: [
                for (int i = 0; i < 10; i++) const _ShimmerBookCard(),
              ],
            );
          } else if (state is QuotesFetchFailed) {
            return Text(state.message!);
          } else if (state is QuotesFetchSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: Space.v1!,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: state.data!
                      .map(
                        (quote) => _Quotes_Card(
                          quote: quote,
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
