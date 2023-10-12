part of 'cubit.dart';

@immutable
class BooksState extends Equatable {
  final List<Book>? data;
  final String? message;

  const BooksState({
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
class BooksDefault extends BooksState {}

@immutable
class BooksFetchLoading extends BooksState {
  const BooksFetchLoading() : super();
}

@immutable
class BooksFetchSuccess extends BooksState {
  const BooksFetchSuccess({List<Book>? data}) : super(data: data);
}

@immutable
class BooksFetchFailed extends BooksState {
  const BooksFetchFailed({String? message}) : super(message: message);
}
