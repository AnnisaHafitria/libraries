part of 'books_bloc.dart';

/// Abstract class to accommodate Books event conditions.
abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

/// Event when [BooksEvent] detects a change in city name.
class BooksFetchEvent extends BooksEvent {
  const BooksFetchEvent();

  @override
  List<Object> get props => [];
}

class BooksDeleteEvent extends BooksEvent {
  final int id;

  const BooksDeleteEvent({required this.id});

  @override
  List<Object> get props => [id];
}
