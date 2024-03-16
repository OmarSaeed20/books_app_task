import 'package:books_app_task/feture/user/model/books.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<BookModel> books = RxList<BookModel>([]);

  @override
  void onInit() {
    _loadBooks();
    super.onInit();
  }

  Future<List<DocumentSnapshot<BookModel>>> getBooks() async {
    QuerySnapshot<BookModel> snapshot = (await _firestore
        .collection('books')
        .get()) as QuerySnapshot<BookModel>;
    return snapshot.docs;
  }

  Future<void> _loadBooks() async {
    QuerySnapshot<BookModel> querySnapshot = (await _firestore
        .collection('books')
        .get()) as QuerySnapshot<BookModel>;
    books.assignAll(querySnapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> addBook(Map<String, dynamic> bookData) async {
    await _firestore.collection('books').add(bookData);
    await _loadBooks();
  }
}
