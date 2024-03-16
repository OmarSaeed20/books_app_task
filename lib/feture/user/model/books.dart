import 'package:equatable/equatable.dart';

class BookModel extends Equatable {
  final String title, author, category, coverImageUrl, pdfUrl;

  const BookModel({
    required this.title,
    required this.author,
    required this.category,
    required this.coverImageUrl,
    required this.pdfUrl,
  });

  factory BookModel.fromJson(Map<String, Object?> json) => BookModel(
        title: json["title"].toString(),
        author: json["author"].toString(),
        category: json["category"].toString(),
        coverImageUrl: json["coverImageUrl"].toString(),
        pdfUrl: json["pdfUrl"].toString(),
      );

  @override
  List<Object> get props => [title, author, category, coverImageUrl, pdfUrl];
}
