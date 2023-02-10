import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraries/presentation/blocs/bloc/books_bloc.dart';
import 'package:libraries/presentation/widgets/books_card_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: BlocBuilder<BooksBloc, BooksState>(
                  builder: (context, state) {
                    if (state is BooksFetchedState) {
                      return GridView.count(
                        scrollDirection: Axis.vertical,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height / 2) /
                                (MediaQuery.of(context).size.width / 2 * 2),
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: state.listBooks
                            .map((books) => BooksCardWidget(books: books))
                            .toList(),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
