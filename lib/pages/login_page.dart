import 'package:flutter/material.dart';
import 'package:sigortamcepte/pages/main_page.dart';
import 'package:sigortamcepte/product/custom_text_field.dart';

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
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "assets/LoginImages/Vector.png",
                fit: BoxFit.contain,
              )),
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
                    child: Text(
                      "Login Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  customTextField(
                    controller: usernameController,
                    borderColor: Colors.black,
                    hintText: "Username,Email or Phone Number",
                  ),
                  customTextField(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    controller: passwordController,
                    borderColor: Colors.black,
                    hintText: "Password",
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MainPage();
                      }));
                    },
                    child: Center(
                      child: Text(
                        "Giriş Yap",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: _size.width / 4,
                          height: 7,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.white, Colors.blue])),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            "Bunlarla Devam Et",
                          ),
                        ),
                        Container(
                          width: _size.width / 4,
                          height: 7,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.blue, Colors.white])),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LoginWithOther(
                        imagePath: "assets/LoginImages/Google.png",
                        ontap: () {},
                      ),
                      LoginWithOther(
                        imagePath: "assets/LoginImages/Facebook.png",
                        ontap: () {},
                      ),
                      LoginWithOther(
                        imagePath: "assets/LoginImages/Group.png",
                        ontap: () {},
                      ),
                    ],
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class LoginWithOther extends StatelessWidget {
  final void Function()? ontap;
  final String imagePath;
  LoginWithOther({super.key, required this.imagePath, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(255, 213, 212, 212)),
        child: Image.asset(imagePath),
      ),
    );
  }
}
