import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsrapp/layouts/news_layout.dart';
import 'package:newsrapp/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 1,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey),
      ),
    );
  }
}
