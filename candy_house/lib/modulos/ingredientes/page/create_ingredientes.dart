import 'package:candy_house/modulos/ingredientes/cubit/ingredientes_cubit.dart';
import 'package:candy_house/modulos/ingredientes/page/ingredientes_page.dart';
import 'package:candy_house/shared/model/item_ingredientes.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';

class CreateIngredientePage extends StatefulWidget {
  const CreateIngredientePage({Key? key}) : super(key: key);
  @override
  _CreateIngredientePageState createState() => _CreateIngredientePageState();
}

class _CreateIngredientePageState extends State<CreateIngredientePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  String? dropdownValue = 'Unidade';
  IngredientesItem ingredientes = IngredientesItem();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<IngredientesCubit, IngredientesStates>(
        listener: (context, state) {
      if (state.status == IngredientesStatus.create) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IngredientesPage(),
          ),
        );
      } else if (state.status == IngredientesStatus.error) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Dados Inválidos',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFFF0065),
                fontSize: 22,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text(
                    'Ok',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFF0065),
                      fontSize: 20,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }, builder: (context, state) {
      if (state.status == IngredientesStatus.loading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
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
                "Cadastrar Ingrediente",
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
                        onSaved: (text) => {ingredientes.nome = text},
                        validator: (text) {
                          return Validador().valido(text);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 8),
                              child: Text(
                                'Data de Validade'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            TextField(
                              controller: dateinput,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Color(0xFF5F5F5F),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0065),
                                    width: 2.0,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50.0)),
                                  borderSide: BorderSide(
                                    color: Color(0xFFFF0065),
                                    width: 2.0,
                                  ),
                                ),
                                //  enabled: false,
                              ),
                              readOnly: true,
                              onTap: () async {
                                ingredientes.dataValidade =
                                    await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(
                                    2000,
                                  ), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2200),
                                );
                                print(ingredientes.dataValidade);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                'Unidade de medida'.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  color: Color(0xFF000000),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 380,
                              height: 50,
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_drop_down),
                                iconSize: 30,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Color(0xFF5F5F5F), fontSize: 20),
                                underline: Container(
                                  height: 2,
                                  color: Color(0xFFFF0065),
                                ),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      dropdownValue = newValue;
                                      ingredientes.unidadeMedida =
                                          dropdownValue;
                                    },
                                  );
                                  print(ingredientes.unidadeMedida);
                                },
                                items: <String>['Unidade', 'Gramas', 'Litros']
                                    .map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: InputWidget(
                          icon: Icons.format_list_numbered,
                          text: 'Quantidade da medida',
                          obscureText: false,
                          onSaved: (text) =>
                              {ingredientes.qtdUtilizada = double.parse(text!)},
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
                          text: 'Quantidade',
                          obscureText: false,
                          onSaved: (text) =>
                              {ingredientes.quantidade = int.parse(text!)},
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
                          text: 'Valor de compra',
                          obscureText: false,
                          onSaved: (text) =>
                              {ingredientes.valorCompra = double.parse(text!)},
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
                            BlocProvider.of<IngredientesCubit>(context)
                                .postCreate(ingredientes);
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
    });
  }
}
