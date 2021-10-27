import 'package:candy_house/modulos/ingredientes/page/descripition_page.dart';
import 'package:candy_house/modulos/products/page/description_product.dart';
import 'package:candy_house/shared/model/item_produto.dart';
import 'package:flutter/material.dart';

class CardProductWidget extends StatefulWidget {
  const CardProductWidget({Key? key, required this.item}) : super(key: key);
  final ProdutosItem item;
  @override
  _CardProductWidgetState createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DescriptionProductPage(item: widget.item,)),
          );
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
                          widget.item.nome,
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
                        'Fabricação: ${widget.item.dataFabricacao.day}/${widget.item.dataFabricacao.month}/${widget.item.dataFabricacao.year}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: 'DMSans',
                        ),
                      ),
                      Text(
                        'Quantidade: ${widget.item.qtdDisponivel}',
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
    
      image = AssetImage("assets/images/produtos/${widget.item.apiName}.png");

    return Container(
      width: 120,
      height: 180,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:  image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
