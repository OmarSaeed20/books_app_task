import 'package:books_app_task/feture/admin/service/admin_controller.dart';
import 'package:books_app_task/feture/public/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelView extends StatelessWidget {
  const AdminPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController _adminController = Get.find();
    final AuthController _authController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _adminController
                    .setAdminStatus(!_adminController.isAdmin.value);
              },
              child: Obx(() {
                return Text(
                  _adminController.isAdmin.value
                      ? 'Revoke Admin'
                      : 'Grant Admin',
                );
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Sign out and navigate to the login screen
                _authController.signOut();
                Get.offAllNamed('/login');
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
