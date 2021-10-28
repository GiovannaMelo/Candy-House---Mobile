import 'package:candy_house/modulos/create_acount/cubit/create_acount_cubit.dart';
import 'package:candy_house/modulos/create_acount/cubit/create_acount_state.dart';
import 'package:candy_house/modulos/create_acount/model/create_acount.dart';
import 'package:candy_house/modulos/create_acount/page/create_page_step1.dart';
import 'package:candy_house/modulos/create_acount/page/create_page_step3.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:candy_house/shared/widgets/step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';

import '../../login/page/login_page.dart';

class CreateStep2Page extends StatefulWidget {
  const CreateStep2Page({Key? key, required this.create}) : super(key: key);
  final CreateAcount create;
  @override
  _createStep2PageState createState() => _createStep2PageState();
}

class _createStep2PageState extends State<CreateStep2Page> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAcountCubit, CreateAcountStates>(
      listener: (context, state) {
        if (state.status == CreateAcountStatus.success) {
        } else if (state.status == CreateAcountStatus.error) {
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
      },
      builder: (context, state) {
        if (state.status == CreateAcountStatus.loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: new SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60),
                ),
                Text(
                  "Crie sua conta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Salsa',
                    fontSize: 40,
                    color: Color(0xFFFF0065),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Já tem cadastro? ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF5C5C5C),
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF0065),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                StepWidget(
                  currentIndex: 2,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      InputWidget(
                        icon: Icons.map,
                        text: 'cep',
                        onSaved: (text) => {widget.create.cep = text},
                        obscureText: false,
                        validator: (text) {
                          return Validador()
                              .add(
                                Validar.OBRIGATORIO,
                                msg: 'Campo Obrigatório',
                              )
                              .minLength(8)
                              .maxLength(10)
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      InputWidget(
                        icon: Icons.streetview,
                        text: 'rua',
                        obscureText: false,
                        onSaved: (text) => {widget.create.rua = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO,
                                  msg: 'Campo Obrigatório')
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      InputWidget(
                        icon: Icons.looks_3_outlined,
                        text: 'número',
                        obscureText: false,
                        onSaved: (text) => {widget.create.numero = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO,
                                  msg: 'Campo Obrigatório')
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 50)),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              color: Color(0xFFFF0065),
                              text: 'Próximo',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  BlocProvider.of<CreateAcountCubit>(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CreateStep3Page(create: widget.create),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
