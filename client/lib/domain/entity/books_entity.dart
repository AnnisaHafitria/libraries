class BooksEntity {
  const BooksEntity({
    required this.id,
    required this.name,
    required this.writer,
    required this.publisher,
    required this.stock,
    required this.note,
  });

  final int id;
  final String name;
  final String writer;
  final String publisher;
  final String stock;
  final String note;
}
