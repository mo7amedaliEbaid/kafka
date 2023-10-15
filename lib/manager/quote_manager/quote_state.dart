part of 'quote_cubit.dart';

@immutable
class QuotesState extends Equatable {
  final List<Quote>? data;
  final String? message;

  const QuotesState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
    data,
    message,
  ];
}

@immutable
class QuotesDefault extends QuotesState {}

@immutable
class QuotesFetchLoading extends QuotesState {
  const QuotesFetchLoading() : super();
}

@immutable
class QuotesFetchSuccess extends QuotesState {
  const QuotesFetchSuccess({List<Quote>? data}) : super(data: data);
}

@immutable
class QuotesFetchFailed extends QuotesState {
  const QuotesFetchFailed({String? message}) : super(message: message);
}
