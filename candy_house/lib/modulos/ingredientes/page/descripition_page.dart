import 'package:candy_house/modulos/home/page/home_page.dart';
import 'package:candy_house/shared/button_border.dart';
import 'package:flutter/material.dart';

class DescripitionPage extends StatefulWidget {
  const DescripitionPage({Key? key}) : super(key: key);

  @override
  _DescripitionPageState createState() => _DescripitionPageState();
}

class _DescripitionPageState extends State<DescripitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: Color(0xFFFF0065),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.edit,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text(
                    'Excluir Ingrediente',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF0065),
                      fontSize: 22,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: const Text(
                    'Deseja excluir permanentemente o ingrediente?',
                    style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontSize: 15,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text(
                        'Cancelar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFF0065),
                          fontSize: 20,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text(
                        'Excluir',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFF0065),
                          fontSize: 20,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              icon: Icon(
                Icons.delete,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/details.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 30, bottom: 20),
              child: Container(
                width: 300,
                height: 300,
                padding: EdgeInsets.all(150),
                constraints: BoxConstraints(),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage("assets/images/leite.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Leite Integral",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFFFF0065),
                  fontSize: 32,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10),
              child: Text(
                "Quantidade em estoque: 20",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xFF5C5C5C),
                  fontSize: 22,
                  fontFamily: 'DMSans',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "Data de Validade",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xFFFF0065),
                    fontSize: 22,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: ButtonBorderWidget(
                  text: "10/02/2022",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
