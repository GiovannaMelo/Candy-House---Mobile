import 'package:candy_house/modulos/create_acount/page/create_page_step1.dart';
import 'package:candy_house/modulos/login/page/login_page.dart';
import 'package:candy_house/shared/button.dart';
import 'package:candy_house/shared/button_next.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset("assets/images/logotipo.png"),
            Padding(padding: EdgeInsets.only(bottom: 100.0)),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ButtonNextWidget(
                    text: '>',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                  ),
                ])
          ],
        ),
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logotipo.png"),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "Olá, gostaria de tornar sua vida ainda mais doce?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Salsa',
                fontSize: 24,
                color: Color(0xFFF35F62),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              "A Candy House é um projeto de levantamento de custos e venda de doces, aqui você encontra o melhor para sua confeitaria.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "DMSans",
                  fontSize: 17,
                  color: Colors.grey.shade800),
            ),
            Padding(padding: EdgeInsets.only(top: 70)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  color: Color(0xFF66BDD0),
                  text: 'Cadastre-se',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateStep1Page()),
                    );
                  },
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                ButtonWidget(
                  color: Color(0xFFFF0065),
                  text: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
