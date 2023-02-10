import 'package:libraries/data/models/books_model.dart';
import 'package:libraries/domain/repositories/books_repository.dart';

class FetchBooksUseCase {
  FetchBooksUseCase({required this.booksRepository});

  final BooksRepository booksRepository;

  Future<List<BooksModel>> call() async {
    return await booksRepository.fetch();
  }
}
