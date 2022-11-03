import 'dart:async';

import 'package:get/get.dart';
import 'package:pokedx/ui/main/main_screen.dart';

class SplashController extends GetxController{


  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.offAll(() => const MainScreen()));
    super.onInit();
  }
}