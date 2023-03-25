import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_db/shared/cubit/states.dart';
import 'package:movie_db/shared/network/remote/dio_helper.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/movies/movies_screen.dart';
import '../../screens/person/person_screen.dart';
import '../../screens/trending/trending_screen.dart';
import '../../screens/tv/tv_screen.dart';

class MovieCubit extends Cubit<MovieStates>{
  MovieCubit():super(MovieInitialState());
static BlocProvider get(context)=>BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const TrendingScreen(),
    const TvScreen(),
    const MovieScreen(),
    const PepoleScreen(),
  ];
  void changeBottomNavBar(int index) {
    // if (index == 1) {
    //   getScienceData();
    // }
    // if (index == 2) {
    //   getSportsData();
    // }
    // if (index == 3) {
    //   getHealthData();
    // }
    // if (index == 4) {
    //   getTechnologyData();
    // }
    currentIndex = index;
    emit(BottomNavBarNewsState());
  }


///// get Trending data ////

  List<dynamic>trending=[];

getTrendingData(){
    emit(GetTrendingLoadingState());
    DioHelper.getData(
      url: '/trending/all/week',
      query: {
        'language':'ar',
        'api_key':'15923dabb14e5f0f8e45ad1634273db6'
      }

    ).then((value) {
      trending=value.data['results'];
      print(trending[0]['backdrop_path']);
      emit(GetTrendingSuccessState());

    }).catchError((error){

      emit(GetTrendingErrorState(error.toString()));

    });
}






}