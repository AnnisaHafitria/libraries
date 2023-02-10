import 'package:libraries/domain/entity/books_entity.dart';

/// Instance of class [BooksEntity] which has the role of fetching and parsing data from/to json.
class BooksModel extends BooksEntity {
  /// Fetch data from json format.
  BooksModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          name: json['name'],
          writer: json['writer'],
          publisher: json['publisher'],
          stock: json['stock'],
          note: json['note'],
        );

  /// Parse data into json format.
  Map<String, dynamic> toJson() => {
        'weather': {
          'id': id,
          'name': name,
          'writer': writer,
          'publisher': publisher,
          'stock': stock,
          'note': note,
        },
      };
}
