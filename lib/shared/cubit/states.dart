abstract class MovieStates {}

class MovieInitialState extends MovieStates{}
class MovieLoadingState extends MovieStates{}
class MovieSuccessState extends MovieStates{}
class MovieErrorState extends MovieStates{}


class GetTrendingLoadingState extends MovieStates{}
class GetTrendingSuccessState extends MovieStates{}
class GetTrendingErrorState extends MovieStates{
  final String error;

  GetTrendingErrorState(this.error);
}

class BottomNavBarNewsState extends MovieStates{}