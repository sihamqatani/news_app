import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsrapp/modules/business.dart';
import 'package:newsrapp/modules/science.dart';
import 'package:newsrapp/modules/settings.dart';
import 'package:newsrapp/modules/sport.dart';
import 'package:newsrapp/shared/cubit/news_states.dart';
import 'package:newsrapp/shared/network/remote/dio_helper.dart';

import '../../modules/business.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(NewsAppInitialStates());

  static NewsAppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sport'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [Business(), Sports(), Science(), Settings()];
  List <dynamic>business=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];

  void getBusiness(){
    emit(NewsAppBusinessLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "sa",
      "category": "business",
      "apiKey": "67f22398aa754203bc1828d4646f845a"
    }).then((value) {
      print(value.data.toString());
      business=value.data['articles'];
      print(' This is Newwws Title::${business[0]['title']}');
      emit( NewsAppBusinessSuccessStates());
    }).catchError((error){print(error.toString());
    emit(NewsAppBusinessErrorStates());});
  }

  void getSports(){
    emit ( NewsApSportsLoadingStates());
    if(sports.length==0){DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "sa",
      "category": "sports",
      "apiKey": "67f22398aa754203bc1828d4646f845a"
    }).then((value) {
      print(value.data.toString());
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit( NewsAppSportsSuccessStates());
    }).catchError((error){print(error.toString());
    emit(NewsAppSportsErrorStates());});}else{
      emit(NewsAppSportsSuccessStates());
    }

  }
 void getScience(){
    emit ( NewsApScienceLoadingStates());
   if(science.length ==0){ DioHelper.getData(url: 'v2/top-headlines', query: {
     "country": "sa",
     "category": "science",
     "apiKey": "67f22398aa754203bc1828d4646f845a"
   }).then((value) {
     print(value.data.toString());
     science=value.data['articles'];
     print(science[0]['title']);
     emit( NewsAppScienceSuccessStates());
   }).catchError((error){print(error.toString());
   emit(NewsAppScienceErrorStates());});}else{emit(NewsAppScienceSuccessStates());}
  }


  void changeBottomNavBar(int index) {
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    currentIndex = index;
    emit(BottomNavStates());
  }
}
