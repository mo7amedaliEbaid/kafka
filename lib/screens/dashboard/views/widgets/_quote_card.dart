part of '../../dashboard.dart';

class _Quotes_Card extends StatelessWidget {
  const _Quotes_Card({super.key, required this.quote});

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Text(quote.quote!);
  }
}
