import 'package:books_app_task/feture/user/model/books.dart';
import 'package:books_app_task/feture/public/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key});

  // final AdminController _adminController = Get.find();

  @override
  Widget build(BuildContext context) {
    final BookService _bookService = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book List'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to add book screen
              Get.toNamed('/add_book');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(
        () {
          if (_bookService.books.isEmpty) {
            return const Center(child: Text('No books available.'));
          } else {
/*             List<BookModel> books = _bookService.books.map((bookData) {
              return BookModel(
                title: bookData['title'],
                author: bookData['author'],
                category: bookData['category'],
                coverImageUrl: bookData['coverImageUrl'],
                pdfUrl: bookData['pdfUrl'],
              );
            }).toList();
 */
            return ListView.builder(
              itemCount: _bookService.books.length,
              itemBuilder: (context, index) {
                BookModel book = _bookService.books[index];
                return ListTile(
                  leading: Image.network(
                    book.coverImageUrl,
                    height: 150,
                    width: 120,
                  ),
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  onTap: () {
                    // Navigate to book details or implement download functionality
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
