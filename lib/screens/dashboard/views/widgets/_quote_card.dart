part of '../../dashboard.dart';

class _Quotes_Card extends StatelessWidget {
  const _Quotes_Card({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: Space.all(),
        child: Center(
            child: Padding(
              padding: Space.all(),
              child: Text(
          quote.quote!,
          style: AppText.b1b,
          textAlign: TextAlign.center,
        ),
            )));
  }
}
