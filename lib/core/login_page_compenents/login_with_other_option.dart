import 'package:flutter/material.dart';

class LoginWithOtherOption extends StatelessWidget {
  const LoginWithOtherOption({
    super.key,
    required Size size,
  }) : _size = size;

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _size.width / 4,
                height: 7,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.blue])),
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
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.white])),
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
        ),
      ],
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
