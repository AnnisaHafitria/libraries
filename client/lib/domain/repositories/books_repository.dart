import 'package:libraries/data/models/books_model.dart';

abstract class BooksRepository {
  Future<bool> delete({required int id});
  Future<List<BooksModel>> fetch();
}
