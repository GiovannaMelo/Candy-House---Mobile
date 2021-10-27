import 'package:candy_house/modulos/home/page/home_page.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 120),
            ),
            Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Salsa',
                fontSize: 60,
                color: Color(0xFFFF0065),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 70)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputWidget(
                  icon: Icons.person,
                  text: 'Usuário',
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                InputWidget(
                  icon: Icons.lock,
                  text: 'Senha',
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                ButtonWidget(
                  color: Color(0xFFFF0065),
                  text: 'Entrar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                ),
                Text(
                  "Ainda não tem cadastro?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 22,
                    color: Color(0xFF5C5C5C),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF0065),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
