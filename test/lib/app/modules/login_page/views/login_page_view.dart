import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapps/app/common/style.dart';
import 'package:movieapps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/contant.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Screen',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              TextField(
                controller: controller.email_controller,
                keyboardType: TextInputType.emailAddress,
                cursorColor: customBlue,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: customBlack),
                decoration: InputDecoration(
                  //yellow borderside
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customBlue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //grey borderside
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customGrey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  label: Text('email',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: customGrey)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.password_controller,
                obscureText: true,
                keyboardType: TextInputType.text,
                cursorColor: customBlue,
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: customBlack),
                decoration: InputDecoration(
                  //yellow borderside
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customBlue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  //grey borderside
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: customGrey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  label: Text('password',
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: customGrey)),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: 300,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
                    // controller.login_api().then((value) {
                    //   if (value) {
                    //     Get.toNamed(
                    //       Routes.LOGIN,
                    //     );
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('Login Failed')));
                    //   }
                    // });
                    // controller.update();
                    controller.doLogin();
                  },
                  
                  child: Text(
                    'Login',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
