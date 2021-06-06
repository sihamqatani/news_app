import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsrapp/shared/components/component.dart';
import 'package:newsrapp/shared/cubit/news_cubit.dart';
import 'package:newsrapp/shared/cubit/news_states.dart';

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        NewsAppCubit();
      },
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
          //  var list = NewsAppCubit.get(context).sports;
          var list = NewsAppCubit.get(context).sports;
            return  articleBuilder(list);
          }),
    );
  }
}
