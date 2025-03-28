import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:katarahv2/app/modules/home/views/home_view.dart';
import 'package:katarahv2/app/modules/upload/views/upload_view.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Username dan password wajib diisi");
      return;
    }

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulasi loading

    if (usernameController.text == "admin" &&
        passwordController.text == "1234") {
      Get.offAll(() => UploadImagePage()); // Pindah ke home dan hapus history
    } else {
      Get.snackbar("Error", "Username atau password salah");
    }

    isLoading.value = false;
  }
}
