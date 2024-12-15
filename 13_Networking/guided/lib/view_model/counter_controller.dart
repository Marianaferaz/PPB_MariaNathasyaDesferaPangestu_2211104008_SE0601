import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void tambahCounter() => counter.value++;

  void resetCounter() => counter.value = 0;
  void getSnackBar() {
    Get.snackbar(
      'GetX Snackbar',
      'Halo ini notifikasi GetX',
      backgroundColor: const Color.fromARGB(255, 222, 135, 240),
      colorText: Colors.black,
    );
  }

  void getbottomshet() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: const Color.fromARGB(255, 222, 135, 240),
        child: const Center(
          child: Text(
            'Ini getX BottomSheet',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
