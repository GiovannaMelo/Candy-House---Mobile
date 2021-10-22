import 'package:candy_house/modulos/login/page/login_page.dart';
import 'package:candy_house/shared/card.dart';
import 'package:candy_house/shared/drawer.dart';
import 'package:candy_house/shared/input_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IngredientesPage extends StatefulWidget {
  const IngredientesPage({Key? key}) : super(key: key);

  @override
  _IngredientesPageState createState() => _IngredientesPageState();
}

class _IngredientesPageState extends State<IngredientesPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  get callbackFunction => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "Ingredientes",
          style: TextStyle(
            fontFamily: 'DMSans',
            fontSize: 25,
            color: Color(0xFF5C5C5C),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFFF0065),
          size: 90,
        ),
        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: Icon(
            Icons.menu,
            size: 60,
            color: Color(0xFFFF0065),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Icon(
            Icons.circle,
            size: 70,
            color: Color(0xFFFF0065),
          ),
        ],
      ),
      drawer: DrawerWidget(),
      body: new SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputSearcWidget(icon: Icons.search, hint: "Buscar"),
                    Padding(
                      padding: EdgeInsets.all(20),
                    ),
                    Center(
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Adicionar Ingredientes",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  ),
                            style: TextStyle(
                              color: Color(0xFFFF0065),
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CardWidget(),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CardWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}