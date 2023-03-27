import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/models/movie_model.dart';

import '../../shared/componts/constance.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list=BlocProvider.of<MovieCubit>(context).trendingResults;
        return Scaffold(
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {

            return Image.network('${imageUrl}${list[index]['poster_path']}') ;
          },)
        );
      },
    );
  }
}
