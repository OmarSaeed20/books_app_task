import 'package:get/get.dart';

class AdminController extends GetxController {
  RxBool isAdmin = false.obs;

  void setAdminStatus(bool status) {
    isAdmin.value = status;
  }
}
