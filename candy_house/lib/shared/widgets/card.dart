import 'package:candy_house/modulos/home/cubit/home_cubit.dart';
import 'package:candy_house/modulos/ingredientes/page/descripition_page.dart';
import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key, required this.item, AssetImage? image})
      : super(key: key);
  final IngredientesItem item;
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
            MaterialPageRoute(
              builder: (context) => DescripitionPage(
                item: widget.item,
              ),
            ),
          ).then((value) {
            return BlocProvider.of<HomeCubit>(context).getItens();
          });
        },
        child: Card(
          elevation: 0,
          color: Color(0xFFFF0065),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            width: 400,
            height: 200,
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  imageCard(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                         "${widget.item.nome}",
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                      ),
                      Text(
                        'Validade: ${widget.item.dataValidade?.day}/${widget.item.dataValidade?.month}/${widget.item.dataValidade?.year}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        'Quantidade: ${widget.item.quantidade}',
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

  Container imageCard() {
    late AssetImage image;

    image = AssetImage("assets/images/ingredientes/${widget.item.apiName}.png");

    return Container(
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
