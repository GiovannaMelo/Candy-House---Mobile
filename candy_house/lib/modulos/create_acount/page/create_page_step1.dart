import 'package:candy_house/modulos/create_acount/page/create_page_step2.dart';
import 'package:candy_house/shared/button.dart';
import 'package:candy_house/shared/input.dart';
import 'package:candy_house/shared/step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../login/page/login_page.dart';

class CreateStep1Page extends StatefulWidget {
  const CreateStep1Page({Key? key}) : super(key: key);

  @override
  _createStep1PageState createState() => _createStep1PageState();
}

class _createStep1PageState extends State<CreateStep1Page> {
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
              padding: EdgeInsets.only(top: 50),
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
              padding: EdgeInsets.only(top: 20),
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
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF0065),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            StepWidget(
              currentIndex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 20)),
                Padding(padding: EdgeInsets.only(top: 40)),
                InputWidget(
                  icon: Icons.business_rounded,
                  text: 'Nome da Confeitaria',
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                InputWidget(
                  icon: Icons.business,
                  text: 'Nome Fantasia',
                ),
                Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                InputWidget(
                  icon: Icons.contact_mail,
                  text: 'CNPJ',
                ),
                Padding(padding: EdgeInsets.only(top: 50)),
                ButtonWidget(
                  color: Color(0xFFFF0065),
                  text: 'Próximo',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateStep2Page(),
                      ),
                    );
                  },
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
