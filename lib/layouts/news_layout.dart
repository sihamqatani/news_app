import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsrapp/shared/cubit/news_cubit.dart';
import 'package:newsrapp/shared/cubit/news_states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCubit()..getBusiness(),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsAppCubit.get(context);
            return Scaffold(

              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
                title: Text('News App'),
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.bottomItem,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          }),
    );
  }
}
