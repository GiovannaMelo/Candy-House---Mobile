import 'package:candy_house/modulos/login/page/login_page.dart';
import 'package:candy_house/modulos/products/cubit/produto_cubit.dart';
import 'package:candy_house/modulos/products/cubit/produtos_states.dart';
import 'package:candy_house/modulos/products/page/create_product.dart';
import 'package:candy_house/shared/widgets/card.dart';
import 'package:candy_house/shared/widgets/card_product.dart';
import 'package:candy_house/shared/widgets/drawer.dart';
import 'package:candy_house/shared/widgets/input_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProdutosCubit>(context).getItens();
  }

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
        key: _key,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "Produtos",
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
                              text: "Adicionar Produtos",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const CreateProduct(),
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
                      ...state.itens.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CardProductWidget(
                            item: e,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
