import 'package:books_app_task/feture/public/services/book_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  final BookService _bookService = Get.find();

  RxList<DocumentSnapshot> books = <DocumentSnapshot>[].obs;

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    books.value = await _bookService.getBooks();
  }
}
