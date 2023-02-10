import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libraries/data/models/books_model.dart';
import 'package:libraries/domain/use_cases/delete_books_use_case.dart';
import 'package:libraries/domain/use_cases/fetch_books_use_case.dart';
import 'package:stream_transform/stream_transform.dart';

part 'books_event.dart';
part 'books_state.dart';

/// Duration of time that used for [debounce] process.
const _duration = Duration(milliseconds: 300);

/// [debounce] used to handle event changes with a certain duration.
EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.deleteBooksUseCase, required this.fetchBooksUseCase})
      : super(BooksInitialState()) {
    on<BooksFetchEvent>(_fetch, transformer: debounce(_duration));
    on<BooksDeleteEvent>(_delete, transformer: debounce(_duration));
  }

  final FetchBooksUseCase fetchBooksUseCase;
  final DeleteBooksUseCase deleteBooksUseCase;

  /// This method is used as a listener fetch event.
  ///
  /// Return [BooksFetchEvent] with [List<BooksModel>] data.
  /// Throw a [BooksErrorState] along with the error message, if there is an error while retrieving list Books data.
  void _fetch(BooksFetchEvent event, Emitter<BooksState> emit) async {
    emit(BooksLoadingState());
    try {
      final listBooks = await fetchBooksUseCase.call();
      emit(BooksFetchedState(listBooks: listBooks));
    } catch (error) {
      emit(BooksErrorState(message: error.toString()));
    }
  }

  void _delete(BooksDeleteEvent event, Emitter<BooksState> emit) async {
    try {
      int id = event.id;
      final result = await deleteBooksUseCase.call(id: id);
      emit(BooksDeletedState(result: result));
    } catch (error) {
      emit(BooksErrorState(message: error.toString()));
    }
  }
}
