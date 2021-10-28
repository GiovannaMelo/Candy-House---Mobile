import 'package:candy_house/modulos/create_acount/page/create_page_step1.dart';
import 'package:candy_house/modulos/home/page/home_page.dart';
import 'package:candy_house/modulos/login/cubit/login_cubit.dart';
import 'package:candy_house/modulos/login/cubit/login_states.dart';
import 'package:candy_house/modulos/login/model/login.dart';
import 'package:candy_house/shared/widgets/button.dart';
import 'package:candy_house/shared/widgets/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validadores/Validador.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  Login login = Login();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else if (state.status == LoginStatus.error) {
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
        if (state.status == LoginStatus.loading) {
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
                  padding: EdgeInsets.only(top: 120),
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Salsa',
                    fontSize: 60,
                    color: Color(0xFFFF0065),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 70)),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InputWidget(
                        icon: Icons.person,
                        text: 'Usuário',
                        obscureText: false,
                        onSaved: (text) => {login.usuario = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO,
                                  msg: 'Campo Obrigatório')
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      InputWidget(
                        icon: Icons.lock,
                        text: 'Senha',
                        obscureText: true,
                        onSaved: (text) => {login.senha = text},
                        validator: (text) {
                          return Validador()
                              .add(Validar.OBRIGATORIO,
                                  msg: 'Campo Obrigatório')
                              .valido(text);
                        },
                      ),
                      Padding(padding: EdgeInsets.only(top: 50)),
                      ButtonWidget(
                        color: Color(0xFFFF0065),
                        text: 'Entrar',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            BlocProvider.of<LoginCubit>(context)
                                .postLogin(login);
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                      ),
                      Text(
                        "Ainda não tem cadastro?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontSize: 22,
                          color: Color(0xFF5C5C5C),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Cadastre-se',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF0065),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateStep1Page(),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
