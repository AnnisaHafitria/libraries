import 'package:libraries/data/data_sources/remote/books_remote_data_source.dart';
import 'package:libraries/data/models/books_model.dart';
import 'package:libraries/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  BooksRepositoryImpl({required this.booksRemoteDataSource});

  final BooksRemoteDataSource booksRemoteDataSource;

  @override
  Future<List<BooksModel>> fetch() async {
    return await booksRemoteDataSource.fetch();
  }

  @override
  Future<bool> delete({required int id}) async {
    return await booksRemoteDataSource.delete(id: id);
  }
}
