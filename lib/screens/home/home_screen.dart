import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Scaffold(
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  physics: BouncingScrollPhysics(),

                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Container(
                         child:  Image.network(
                           '${imageUrl}/26uCzg0yigXqjcM9dCGCDihoXLM.jpg',
                         ),
                       ),
                        const SizedBox(height: 10,),

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
