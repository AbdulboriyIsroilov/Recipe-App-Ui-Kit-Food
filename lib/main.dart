import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/login_repostoriy.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/login_sign_up_repositores/sign_up_repostory.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/community_repository.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/recipe_repository/my_recipes_repositoriy.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/top_chefs_repository/top_chef_detail_reposty.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/top_chefs_repository/top_chefs_repostory.dart';

import 'core/auth_interceptor.dart';
import 'data/repositores/home_repository/home_repository.dart';
import 'data/repositores/on_boarding_repositores/allergic_repository.dart';
import 'data/repositores/on_boarding_repositores/cuisines_repository.dart';
import 'data/repositores/on_boarding_repositores/on_boarding_repository.dart';
import 'data/repositores/recipe_repository/recipe_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          Provider(create: (context) => FlutterSecureStorage()),
          Provider(create: (context) => AuthInterceptor(secureStorage: context.read())),
          Provider(
            create: (context) => Dio(
              BaseOptions(
                baseUrl: "http://192.168.11.33:8888/api/v1",
                validateStatus: (status) => true,
              ),
            )..interceptors.add(context.read<AuthInterceptor>()),
          ),
          Provider(
            create: (context) => ApiClient(dio: context.read()),
          ),
          Provider(
            create: (context) => LoginRepository(client: context.read(), secureStorage: context.read()),
          ),
          Provider(create: (context) => SignUpRepostory(client: context.read())),
          Provider(create: (context) => AllergicRepository()),
          Provider(create: (context) => CuisinesRepository()),
          Provider(create: (context) => OnBoardingRepository()),
          Provider(create: (context) => HomeRepository()),
          Provider(create: (context) => MyRecipesRepositoriy(client: context.read())),
          Provider(create: (context) => TopChefsRepostory()),
          Provider(create: (context) => TopChefDetailRepostory()),
          Provider(create: (context) => RecipeRepository(clint: context.read())),
          Provider(create: (context) => CommunityRepository(clint: context.read())),
        ],
        builder: (context, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
