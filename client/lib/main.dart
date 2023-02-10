import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraries/presentation/blocs/bloc/books_bloc.dart';
import 'package:libraries/presentation/pages/main_page.dart';

import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Inject all dependecies injector and wait for it is done
  await di.init();
  runApp(const Books());
}

class Books extends StatelessWidget {
  const Books({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<BooksBloc>()
            ..add(
              const BooksFetchEvent(),
            ),
        ),
      ],
      child: const MaterialApp(
        home: MainPage(),
      ),
    );
  }
}
