import 'package:dloc_training/Bussiness_Logic/cubit/characters_cubit.dart';
import 'package:dloc_training/Data/API/Characters_API.dart';
import 'package:dloc_training/Data/Models/Character.dart';
import 'package:dloc_training/Data/Repository/Characters_Repository.dart';
import 'package:dloc_training/UI/Screens/CharacterDetails.dart';
import 'package:dloc_training/UI/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter routes = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
              create: (context) =>
                  CharactersCubit(CharactersRepository(CharactersAPI())),
              child: Home());
        },
      ),
      GoRoute(name:'/character_screen' ,
        path: '/character_screen',
        builder: (BuildContext context, GoRouterState state) {
          return CharacterDetails(
            character: state.extra as Character,
          );
        },
      ),
    ],
  );
}
