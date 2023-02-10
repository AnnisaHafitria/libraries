part of 'books_bloc.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object?> get props => [];
}

/// The state where [BooksState] has fetched [List<BooksModel>].
class BooksFetchedState extends BooksState {
  const BooksFetchedState({required this.listBooks});

  final List<BooksModel> listBooks;

  @override
  List<Object?> get props => [listBooks];
}

/// The state where [BooksState] is initializing the state.
class BooksInitialState extends BooksState {}

/// The state where [BooksState] is loading data.
class BooksLoadingState extends BooksState {}

/// The state where [BooksState] has loaded [BooksModel].
class BooksLoadedState extends BooksState {
  const BooksLoadedState({this.books});

  final BooksModel? books;

  @override
  List<Object> get props => [books!];
}

/// The state where [BooksState] has an error including and error message.
class BooksErrorState extends BooksState {
  const BooksErrorState({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class BooksDeletedState extends BooksState {
  const BooksDeletedState({required this.result});

  final bool result;

  @override
  List<Object?> get props => [result];
}
