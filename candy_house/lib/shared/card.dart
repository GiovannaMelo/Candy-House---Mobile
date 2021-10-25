import 'package:candy_house/modulos/home/model/item_home.dart';
import 'package:candy_house/modulos/ingredientes/page/descripition_page.dart';
import 'package:candy_house/shared/product.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.item}) : super(key: key);
  final HomeItem item;
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DescripitionPage()),
          );
        },
        child: Card(
          elevation: 0,
          color: Color(0xFFFF0065),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            height: 200,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Container(
                    width: 80,
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/leite.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item.nome,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                      ),
                      Text(
                        'Validade: 22/11/2021',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        'Quantidade: 10',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'DMSans',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
