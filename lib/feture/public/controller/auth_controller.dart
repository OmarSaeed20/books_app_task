// auth_controller.dart
import 'package:books_app_task/feture/public/services/auth_services.dart';
import 'package:books_app_task/feture/public/services/book_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService _authService = Get.find();

  Rx<User?> user = Rx<User?>(null);

  @override
  void onInit() {
    user.bindStream(_authService.user as Stream<User?>);
    super.onInit();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _authService.signUpWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}

