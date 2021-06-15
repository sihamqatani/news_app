import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsrapp/layouts/news_layout.dart';
import 'package:newsrapp/shared/cubit/news_cubit.dart';
import 'package:newsrapp/shared/cubit/news_states.dart';
import 'package:newsrapp/shared/network/local/cashe_helpoer.dart';
import 'package:newsrapp/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  bool isDark = CasheHelper.getBooleanData(key:'isDark');
  runApp(NewsApp(isDark));
}


class NewsApp extends StatelessWidget {
 bool isDark;

  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) =>
    NewsAppCubit()
      ..getBusiness()..changeAppMode(fromShared: isDark),

      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (context, state) {}, builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(
            scaffoldBackgroundColor: HexColor('333739'),
            primarySwatch: Colors.deepOrange,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepOrange,
            ),
            textTheme: TextTheme(bodyText1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )),

            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                backwardsCompatibility: false,
                backgroundColor: HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                )),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                backgroundColor: HexColor('333739'),
                elevation: 20,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey),),
          themeMode: NewsAppCubit
              .get(context)
              .isDark ? ThemeMode.dark : ThemeMode.light,
          home: NewsLayout(),
          theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  )),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 20,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey),
              textTheme: TextTheme(bodyText1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ))
          ),
        );
      }),

    );
  }
}
