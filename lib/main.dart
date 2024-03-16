import 'package:books_app_task/feture/admin/service/admin_controller.dart';
import 'package:books_app_task/feture/public/controller/book_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feture/admin/view/add_book/add_book_view.dart';
import 'feture/admin/view/admin_panel/view/admin_panel_view.dart';
import 'feture/public/controller/auth_controller.dart';
import 'feture/public/services/auth_services.dart';
import 'feture/public/view/login/view/login_view.dart';
import 'feture/user/view/books_view.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart'; // Replace with your actual configuration file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      /* options: DefaultFirebaseOptions.currentPlatform */);

  Get.put(AuthService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();
    return GetMaterialApp(
      title: 'Ebook App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/login',
      getPages: [
        // GetPage(name: '/', page: () => SplashScreen()),
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: BindingsBuilder(() => AuthController()),
        ),
        GetPage(
          name: '/book_list',
          page: () => const BookListView(),
          binding: BindingsBuilder(() => BookController()),
        ),
        GetPage(
          name: '/add_book',
          page: () => AddBookView(),
          binding: BindingsBuilder(() => BookController()),
        ),
        GetPage(
          name: '/admin_panel',
          page: () => const AdminPanelView(),
          binding: BindingsBuilder(() => AdminController()),
        ),
      ],
      home: Obx(
        () {
          return authController.user.value == null
              ? LoginView()
              : const BookListView();
        },
      ),
    );
  }
}
