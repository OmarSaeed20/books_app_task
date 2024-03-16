import 'package:books_app_task/feture/admin/service/admin_controller.dart';
import 'package:books_app_task/feture/public/services/book_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:get/get.dart';

class AddBookView extends StatelessWidget {
  final BookService _bookService = Get.find();
  final AdminController _adminController = Get.find();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _coverImage;
  File? _pdfFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Book')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Pick cover image
                final pickedFile =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  _coverImage = File(pickedFile.path);
                }
              },
              child: const Text('Pick Cover Image'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Upload book to Firebase Storage and get download URL
                // ...

                // Add book data to Firestore
                await _bookService.addBook(
                  {
                    'title': _titleController.text,
                    'author': _authorController.text,
                    'category': _categoryController.text,
                    'coverImageUrl': _coverImage, // Replace with actual URL
                    // 'pdfUrl': 'URL_FROM_STORAGE', // Replace with actual URL
                  },
                );

                // Navigate back to book list
                Get.back();
              },
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
