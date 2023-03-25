import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/cubit/cubit.dart';
import 'package:movie_db/shared/cubit/states.dart';
import 'package:movie_db/shared/network/remote/dio_helper.dart';

import '../shared/componts/ui_componts.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<MovieCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movie DB'),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: const DefBottomNavBar(),
          floatingActionButton: FloatingActionButton(
            child: Text('addd'),
            onPressed: () {
              DioHelper.getData(url: '/trending/all/week', query: {
                'language': 'ar',
                'api_key': '15923dabb14e5f0f8e45ad1634273db6'
              }).then((value) {
                var trending = value.data;
                print(trending['results']);
              }).catchError((error) {});
            },
          ),
        );
      },
    );
  }
}
