import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt? number = 0.obs;
  void increment() {
    number!.value++;
    update();
  }

  void decrement() {
    number!.value--;
    update();
  }
}
