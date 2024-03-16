import 'package:books_app_task/feture/public/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final AuthController _authController = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email')),
            TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password')),
            ElevatedButton(
              onPressed: () async {
                await _authController.signInWithEmailAndPassword(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
/* 
// book_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook_app/controllers/book_controller.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});


  @override
  Widget build(BuildContext context) {
  final BookController _bookController = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Book List')),
      body: Obx(() {
        if (_bookController.books.isEmpty) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return ListView.builder(
            itemCount: _bookController.books.length,
            itemBuilder: (context, index) {
              var book = _bookController.books[index];
              return ListTile(title: Text(book['title']));
            },
          );
        }
      }),
    );
  }
}
 */