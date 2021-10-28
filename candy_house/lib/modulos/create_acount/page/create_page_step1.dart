import 'package:candy_house/modulos/create_acount/cubit/create_acount_cubit.dart';
import 'package:candy_house/modulos/create_acount/cubit/create_acount_state.dart';
import 'package:candy_house/modulos/create_acount/model/create_acount.dart';
import 'package:candy_house/modulos/create_acount/page/create_page_step2.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:candy_house/shared/widgets/step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';

import '../../login/page/login_page.dart';

class CreateStep1Page extends StatefulWidget {
  const CreateStep1Page({Key? key}) : super(key: key);

  @override
  _createStep1PageState createState() => _createStep1PageState();
}

class _createStep1PageState extends State<CreateStep1Page> {
  final _formKey = GlobalKey<FormState>();
  CreateAcount create = CreateAcount();

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
                  padding: EdgeInsets.only(top: 50),
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
                  padding: EdgeInsets.only(top: 20),
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
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
                StepWidget(
                  currentIndex: 1,
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
                        icon: Icons.business_rounded,
                        text: 'Nome da Confeitaria',
                        obscureText: false,
                        onSaved: (text) => {create.nome = text},
                        validator: (text) {
                          return Validador().valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      InputWidget(
                        icon: Icons.business,
                        text: 'Nome Fantasia',
                        obscureText: false,
                        onSaved: (text) => {create.nomeFantasia = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                      InputWidget(
                        icon: Icons.contact_mail,
                        text: 'CNPJ',
                        obscureText: false,
                        onSaved: (text) => {create.cnpj = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.CNPJ, msg: 'CNPJ Inválido')
                              .add(Validar.OBRIGATORIO)
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 50)),
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
                                builder: (context) => CreateStep2Page(create: create),
                              ),
                            );
                          }
                        },
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
