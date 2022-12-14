import 'package:dio/dio.dart';
import 'package:movieapps/app/models/search.dart';
import 'package:movieapps/app/modules/home/views/home_view.dart';
import 'package:movieapps/app/services/search_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginPageController extends GetxController {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  late bool isLogin = false;
  String email = "";
  String name = "";
  bool? loginStatus;

  doLogin() async {
    debugPrint("Tombol Login: Di Klik");

    Dio dio = Dio();
    var res = await dio.get("http://172.16.1.2:3000/User");
    //for ech res
    print(res.data.toString());
    for (var i = 0; i < res.data.length; i++) {
      var item = res.data[i];
      if (res.data[i]['email'] == email_controller.text &&
          res.data[i]['password'] == password_controller.text) {
        email = item['email'];
        name = item['name'];
        loginStatus = true;
      } else {
        loginStatus = false;
      }
    }

    if (loginStatus == true) {
      email_controller.text = "";
      password_controller.text = "";
      Get.snackbar("Success", "Berhasil Login", colorText: Colors.green);

      Get.to(HomeView());
    } else {
      Get.snackbar("Warning", "Email atau password salah",
          duration: Duration(seconds: 1), colorText: Colors.red);
    }
  }
}
