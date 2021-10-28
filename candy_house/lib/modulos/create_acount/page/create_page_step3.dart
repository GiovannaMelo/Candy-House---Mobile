import 'package:candy_house/modulos/create_acount/cubit/create_acount_cubit.dart';
import 'package:candy_house/modulos/create_acount/cubit/create_acount_state.dart';
import 'package:candy_house/modulos/create_acount/model/create_acount.dart';
import 'package:candy_house/modulos/home/page/home_page.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:candy_house/shared/widgets/step.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';

import '../../login/page/login_page.dart';

class CreateStep3Page extends StatefulWidget {
  const CreateStep3Page({Key? key, required this.create}) : super(key: key);
  final CreateAcount create;
  @override
  _createStep3PageState createState() => _createStep3PageState();
}

class _createStep3PageState extends State<CreateStep3Page> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAcountCubit, CreateAcountStates>(
        listener: (context, state) {
      if (state.status == CreateAcountStatus.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
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
    }, builder: (context, state) {
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
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            ),
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
                currentIndex: 3,
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
                      icon: Icons.mail,
                      text: 'email',
                      obscureText: false,
                      onSaved: (text) => {widget.create.email = text},
                      validator: (text) {
                        return Validador()
                            .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                            .add(Validar.EMAIL, msg: 'Email Inválido')
                            .valido(text);
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    InputWidget(
                      icon: Icons.person,
                      text: 'usuário',
                      onSaved: (text) => {widget.create.usuario = text},
                       validator: (text) {
                        return Validador()
                            .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                            .minLength(4)
                            .valido(text);
                      },
                      obscureText: false,
                    ),
                    Padding(padding: EdgeInsets.only(top: 10, bottom: 10)),
                    InputWidget(
                      icon: Icons.lock,
                      text: 'senha',
                      obscureText: true,
                      onSaved: (text) => {widget.create.senha = text},
                        validator: (text) {
                        return Validador()
                            .add(Validar.OBRIGATORIO, msg: 'Campo Obrigatório')
                            .minLength(4)
                            .valido(text);
                      },
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          ButtonWidget(
                            color: Color(0xFFFF0065),
                            text: 'Cadastrar',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                BlocProvider.of<CreateAcountCubit>(context)
                                    .postCreate(widget.create);
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
    });
  }
}
