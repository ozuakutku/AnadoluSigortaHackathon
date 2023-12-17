import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigortamcepte/core/login_page_compenents/bottom_line.dart';
import 'package:sigortamcepte/core/login_page_compenents/login_button.dart';
import 'package:sigortamcepte/core/login_page_compenents/login_with_other_option.dart';
import 'package:sigortamcepte/product/custom_text_field.dart';
import 'package:sigortamcepte/service/datas.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Datas datas = Provider.of<Datas>(context);
    var _size = MediaQuery.of(context).size;
    var loginDetailsText = const Text(
      "Login Details",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          bottomLine(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                          "assets/LoginImages/loginscreendoor.png")),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: loginDetailsText,
                  ),
                  CustomTextField(
                    controller: usernameController,
                    borderColor: Colors.black,
                    hintText: "Username,Email or Phone Number",
                  ),
                  CustomTextField(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    controller: passwordController,
                    borderColor: Colors.black,
                    hintText: "Password",
                  ),
                  LoginButton(),
                  LoginWithOtherOption(size: _size)
                ]),
          ),
        ],
      ),
    );
  }
}
