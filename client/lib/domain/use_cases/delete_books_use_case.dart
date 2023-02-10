import 'package:libraries/domain/repositories/books_repository.dart';

class DeleteBooksUseCase {
  DeleteBooksUseCase({required this.booksRepository});

  final BooksRepository booksRepository;

  Future<bool> call({required int id}) async {
    return await booksRepository.delete(id: id);
  }
}
