import 'package:candy_house/modulos/home/cubit/home_cubit.dart';
import 'package:candy_house/shared/card.dart';
import 'package:candy_house/shared/carousel_slider.dart';
import 'package:candy_house/shared/drawer.dart';
import 'package:candy_house/shared/input_search.dart';
import 'package:candy_house/shared/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get items => null;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  get callbackFunction => null;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getItens();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      if (state.status == HomeStatus.loading) {
        return Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      }
      state.itens;
      return Scaffold(
        key: _key,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            "Home",
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
                      Text(
                        "Produtos",
                        style: TextStyle(
                          color: Color(0xFFFF0065),
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      CarouselSliderWidget(
                        image: AssetImage("assets/images/trufa.png"),
                        items: items,
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          onPageChanged: callbackFunction,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                      ),
                      Text(
                        "Ingredientes",
                        style: TextStyle(
                          color: Color(0xFFFF0065),
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      ...state.itens.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CardWidget(
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
