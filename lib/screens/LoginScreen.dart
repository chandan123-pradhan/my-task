import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/screens/HomeScreen.dart';
import 'package:my_task/screens/RegisterScren.dart';
import 'package:my_task/utils/SharedPrefKeys.dart';
import 'package:my_task/utils/sharedPref.dart';
import 'package:my_task/widget/toastWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showProgress = false;
  late String email, password;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SharedPref shareedPref = SharedPref();
  void login() async {
    if (emailcontroller.text.isEmpty) {
      showErrorToast("Please Enter Email first");
    } else if (passwordcontroller.text.isEmpty) {
      showErrorToast("Please Enter password first");
    } else {
      String userData = await shareedPref.getData(SharedPrefKeys.registerData);
      if (userData != '0') {
        Map data = jsonDecode(userData);
        if (data['email'] == emailcontroller.text &&
            data['password'] == passwordcontroller.text) {
          showSuccessToast("Login Successfully done");
          Get.offAll(const HomeScreen());
        } else {
          showErrorToast("This account is not Exist");
          print("email and password not matched");
        }
      } else {
        showErrorToast("This account is not Exist");
        print("user have not account");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
              ),
              height: MediaQuery.of(context).size.height * .515,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, left: 25),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'SignIn',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: "Enter Email",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) {
                        email = value;
                      },
                      controller: emailcontroller,
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true, autofocus: true,

                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                      ),
                      validator: (value) {
                        if (value!.length < 8) {
                          return 'Password must be longer than 8 characters.';
                        }
                        return null;
                      },
                      controller: passwordcontroller,

                      // controller: password,
                      textInputAction: TextInputAction.next,
                      //focusNode: _passwordFocus,
                      onFieldSubmitted: (value) {
                        password = value;
                      }, // get value from TextField

                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 31.0),
                    child: SizedBox(
                      width: 300,
                      height: 50,
                      child: RaisedButton(
                          color: Colors.yellow,
                          onPressed: () {
                            login();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            // side: BorderSide(color: ColorsConsts.lightcyan, width: 2)
                          ),
                          textColor: Colors.white,
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: const Padding(
                        padding: EdgeInsets.only(left: 8, top: 10),
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VendorRegisterScreen()));
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )));
  }
}
