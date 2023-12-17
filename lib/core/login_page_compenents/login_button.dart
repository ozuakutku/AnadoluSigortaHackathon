import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigortamcepte/pages/main_page.dart';
import 'package:sigortamcepte/service/datas.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          )),
      onPressed: () async {
        late Datas datas = Provider.of<Datas>(context, listen: false);

        datas.getDatas();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      },
      child: const Center(
        child: Text(
          "Giriş Yap",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
