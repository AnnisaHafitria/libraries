import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:libraries/data/models/books_model.dart';

abstract class BooksRemoteDataSource {
  Future<bool> delete({required int id});
  Future<List<BooksModel>> fetch();
}

class BooksRemoteDataSourceImpl implements BooksRemoteDataSource {
  BooksRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<BooksModel>> fetch() async {
    try {
      List<BooksModel> listBooks = [];
      final response =
          await dio.get('http://localhost/libraries/server/api/books/fetch');

      for (var data in response.data['data']) {
        BooksModel books = BooksModel.fromJson(data);
        listBooks.add(books);
      }
      log('listBooks:$listBooks');
      return listBooks;
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool> delete({required int id}) async {
    try {
      final response = await dio.delete(
          'http://localhost/libraries/server/api/books/delete.php',
          data: {"id": id});
      if (response.statusCode == 200 && response.data.toString().isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw (DioError(
        requestOptions: e.requestOptions,
        response: e.response,
        type: e.type,
        error: e.error,
      ));
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
