import 'package:candy_house/modulos/products/page/product_page.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:validadores/Validador.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({ Key? key }) : super(key: key);

  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    String dropdownValue = 'Unidade';
    return Scaffold(
      appBar: AppBar(
          toolbarHeight:70,
          backgroundColor: Color(0xFFFF0065),
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
      
        ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            Text(
              "Cadastrar Produto",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Salsa',
                fontSize: 30,
                color: Color(0xFFFF0065),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 40)),
                    InputWidget(
                      icon: Icons.cake,
                      text: 'Nome',
                      obscureText: false,
                      //    onSaved: (text) => {create.nome = text},
                      validator: (text) {
                        return Validador().valido(text);
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    InputWidget(
                      icon: Icons.calendar_today,
                      text: 'Data Fabricação',
                      obscureText:
                          false, //  onSav ed: (text) => {create.nomeFantasia = text},
                      validator: (text) {
                        return Validador()
                            .add(Validar.OBRIGATORIO)
                            .valido(text);
                      },
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InputWidget(
                        icon: Icons.format_list_numbered,
                        text: 'Quantidade fabricada',
                        obscureText: false,
                        //    onSaved: (text) => {create.cnpj = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InputWidget(
                        icon: Icons.format_list_numbered_outlined,
                        text: 'Quantidade disponivel',
                        obscureText: false,
                        //    onSaved: (text) => {create.cnpj = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: InputWidget(
                        icon: Icons.money,
                        text: 'Valor de fabricação',
                        obscureText: false,
                        //    onSaved: (text) => {create.cnpj = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 0),
                      child: InputWidget(
                        icon: Icons.money,
                        text: 'Valor de venda',
                        obscureText: false,
                        //    onSaved: (text) => {create.cnpj = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    ButtonWidget(
                      color: Color(0xFFFF0065),
                      text: 'Cadastrar',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          //    BlocProvider.of<CreateAcountCubit>(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}