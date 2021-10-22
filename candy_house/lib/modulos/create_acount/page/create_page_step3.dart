import 'package:candy_house/modulos/create_acount/page/create_page_step2.dart';
import 'package:candy_house/shared/button.dart';
import 'package:candy_house/shared/input.dart';
import 'package:candy_house/shared/step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../login/page/login_page.dart';

class CreateStep3Page extends StatefulWidget {
  const CreateStep3Page({Key? key}) : super(key: key);

  @override
  _createStep3PageState createState() => _createStep3PageState();
}

class _createStep3PageState extends State<CreateStep3Page> {
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
              padding: EdgeInsets.only(top: 60),
            ),
            Text(
              "Crie sua conta",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Salsa',
                fontSize: 40,
                color: Color(0xFFFF0065),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Já tem cadastro? ',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xFF5C5C5C),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF0065),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            StepWidget(
              currentIndex: 3,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Padding(padding: EdgeInsets.only(top: 40)),
                InputWidget(
                  icon: Icons.mail,
                  text: 'email',
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                InputWidget(
                  icon: Icons.person,
                  text: 'usuário',
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                InputWidget(
                  icon: Icons.lock,
                  text: 'senha',
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      color: Color(0xFFFF0065),
                      text: 'Voltar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateStep2Page(),
                          ),
                        );
                      },
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    ButtonWidget(
                      color: Color(0xFFFF0065),
                      text: 'Cadastrar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
