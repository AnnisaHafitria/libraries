import 'package:dio/dio.dart';
import 'package:libraries/domain/use_cases/delete_books_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:libraries/data/data_sources/remote/books_remote_data_source.dart';
import 'package:libraries/data/repositories/books_repository_impl.dart';
import 'package:libraries/domain/repositories/books_repository.dart';
import 'package:libraries/domain/use_cases/fetch_books_use_case.dart';
import 'package:libraries/presentation/blocs/bloc/books_bloc.dart';

/// Initialize sl as a service locator.
final sl = GetIt.instance;

/// Initialize all setup service locator.
Future<void> init() async {
  // bloc
  // registering service locator for [LecturersBloc].
  sl.registerFactory(
      () => BooksBloc(fetchBooksUseCase: sl(), deleteBooksUseCase: sl()));

  // usecases
  // registering service locator for [FetchProductUseCase].
  sl.registerLazySingleton(() => FetchBooksUseCase(booksRepository: sl()));
  sl.registerLazySingleton(() => DeleteBooksUseCase(booksRepository: sl()));

  // repositories
  // registering service locator for [ProductRepository].
  sl.registerLazySingleton<BooksRepository>(
      () => BooksRepositoryImpl(booksRemoteDataSource: sl()));

  // datasources
  // registering service locator for [ProductRemoteDataSource].
  sl.registerLazySingleton<BooksRemoteDataSource>(
      () => BooksRemoteDataSourceImpl(dio: sl()));

  // external
  // registering service locator for [Dio()].
  sl.registerLazySingleton(() => Dio());
}
