import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:libraries/data/models/books_model.dart';
import 'package:libraries/presentation/blocs/bloc/books_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksCardWidget extends StatelessWidget {
  const BooksCardWidget({super.key, required this.books});

  final BooksModel books;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.transparent),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                  image: Image.network(
                    'https://pghc.uma.ac.id/wp-content/uploads/2021/10/buku1.jpg',
                  ).image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            books.name,
            style: const TextStyle(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            books.writer,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            books.publisher,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            books.stock,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            books.note,
            style: const TextStyle(fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
              onTap: () {
                context.read<BooksBloc>().add(BooksDeleteEvent(id: books.id));
                context.read<BooksBloc>().add(const BooksFetchEvent());
                log("Success Deleted : ${books.id}");
              },
              child: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
