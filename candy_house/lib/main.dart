import 'package:candy_house/modulos/home/cubit/home_cubit.dart';
import 'package:candy_house/modulos/ingredientes/cubit/ingredientes_cubit.dart';
import 'package:candy_house/modulos/login/cubit/login_cubit.dart';
import 'package:candy_house/modulos/onboarding/page/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modulos/create_acount/cubit/create_acount_cubit.dart';
import 'modulos/products/cubit/produto_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => IngredientesCubit()),
        BlocProvider(create: (context) => ProdutosCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CreateAcountCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
