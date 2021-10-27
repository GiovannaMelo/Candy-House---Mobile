import 'package:candy_house/modulos/products/cubit/produto_cubit.dart';
import 'package:candy_house/modulos/products/cubit/produtos_states.dart';
import 'package:candy_house/shared/model/item_produto.dart';
import 'package:candy_house/shared/widgets/button_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionProductPage extends StatefulWidget {
  const DescriptionProductPage({Key? key, required this.item})
      : super(key: key);
  final ProdutosItem item;
  @override
  _DescriptionProductPageState createState() => _DescriptionProductPageState();
}

class _DescriptionProductPageState extends State<DescriptionProductPage> {
  void initState() {
    super.initState();
    BlocProvider.of<ProdutosCubit>(context).getItens();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutosCubit, ProdutosStates>(
      builder: (context, state) {
        if (state.status == ProdutosStatus.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
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
                        'Excluir Produto',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFF0065),
                          fontSize: 22,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Deseja excluir permanentemente o produto?',
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
                          onPressed: () {
                            BlocProvider.of<ProdutosCubit>(context)
                                .deleteItem(widget.item.idProduto);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
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
                  padding: const EdgeInsets.only(top: 110.0, left: 50),
                  child: imageDescription(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.item.nome,
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
                    "Quantidade em estoque: ${widget.item.qtdDisponivel}",
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
                      "Data de Fabricação",
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
                      text:
                          " ${widget.item.dataFabricacao.day}/${widget.item.dataFabricacao.month}/${widget.item.dataFabricacao.year}",
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Container imageDescription() {
    late AssetImage image;

    image = AssetImage("assets/images/produtos/${widget.item.apiName}.png");

    return Container(
      width: 250,
      height: 250,
      padding: EdgeInsets.all(150),
      constraints: BoxConstraints(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
