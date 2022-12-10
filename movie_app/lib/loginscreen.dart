import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  late bool isLogin = false;

  Future<bool> login_api() async {
    Dio dio = Dio();
    var res = await dio.get("http://172.16.1.2:3000/User");

    //for ech res
    for (var i = 0; i < res.data.length; i++) {
      if (res.data[i]['email'] == email_controller.text &&
          res.data[i]['password'] == password_controller.text) {
        print('login success');
        setState(() {
          isLogin = true;
        });
      } else {
        print('login failed');
      }
    }
    return isLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login Screen'),
              TextField(
                controller: email_controller,
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
                controller: password_controller,
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
              ElevatedButton(
                onPressed: () {
                  login_api().then((value) {
                    if (value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      //create snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Login Failed')));
                    }
                  });
                  setState(() {});
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
