import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';

import 'data/repositores/on_boarding_repositores/allergic_repository.dart';
import 'data/repositores/on_boarding_repositores/cuisines_repository.dart';
import 'data/repositores/on_boarding_repositores/on_boarding_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = Routers().router;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context)=>AllergicRepository()),
          Provider(create: (context)=>CuisinesRepository()),
          Provider(create: (context)=>OnBoardingRepository()),

        ],
        builder:(context,child)=> MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}
