import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsrapp/shared/components/component.dart';
import 'package:newsrapp/shared/cubit/news_cubit.dart';
import 'package:newsrapp/shared/cubit/news_states.dart';

class Search extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsAppCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaulttextForm(
                      controller: searchController,
                      label: 'search',
                      validator: (String value) {
                        if (value.isEmpty) {
                          print('search must not empty');
                        }
                      },
                      type: TextInputType.text,
                      prefix: Icons.search,
                      onChange: (String value) {
                        NewsAppCubit.get(context).getSearch(value);
                      }),
                ),
                Expanded(child: articleBuilder(list, isSearch: true)),
              ],
            ),
          );
        });
  }
}
