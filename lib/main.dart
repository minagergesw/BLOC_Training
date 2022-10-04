import 'package:dloc_training/AppRouter.dart';
import 'package:dloc_training/Bussiness_Logic/cubit/characters_cubit.dart';
import 'package:dloc_training/Data/API/Characters_API.dart';
import 'package:dloc_training/Data/Repository/Characters_Repository.dart';
import 'package:dloc_training/UI/Screens/CharacterDetails.dart';
import 'package:dloc_training/UI/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
   routerConfig:AppRouter().routes ,
    );
  }





  
}

