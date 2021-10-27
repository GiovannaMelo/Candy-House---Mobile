import 'package:candy_house/modulos/home/cubit/home_cubit.dart';
import 'package:candy_house/modulos/home/page/home_page.dart';
import 'package:candy_house/modulos/ingredientes/page/ingredientes_page.dart';
import 'package:candy_house/modulos/login/page/login_page.dart';
import 'package:candy_house/modulos/products/page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFFFF0065),
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFFF0065),
                ),
                child: Icon(
                  Icons.circle,
                  size: 130,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: Text(
                  "Candy House",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Center(
              child: ListTile(
                title: Text(
                  "Candy_House@gmail.com",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 35,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),      
                  );
                },
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                  size: 35,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IngredientesPage()),
                  );
                },
                title: Text(
                  'Ingredientes',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
              child: ListTile(
                leading: Icon(
                  Icons.cake,
                  color: Colors.white,
                  size: 35,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductPage()),
                  );
                },
                title: Text(
                  'Produtos',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 35,
                ),
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                title: Text(
                  'Sair',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'DMSans',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
