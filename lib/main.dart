import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/core/client.dart';
import 'package:recipe_app_ui_kit_food/core/router/router.dart';
import 'package:recipe_app_ui_kit_food/core/utils/themes.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/auth_repostoriy.dart';
import 'package:recipe_app_ui_kit_food/data/repositores/user_repository.dart';

import 'core/auth_interceptor.dart';
import 'data/repositores/categories_repository.dart';
import 'data/repositores/onboarding_repository.dart';
import 'data/repositores/recipes_repository.dart';
import 'data/repositores/reviews_repository.dart';
import 'features/common/manegers/app_theme_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final themes = AppThemes();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AppThemeViewModel()),
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
          Provider(create: (context) => ApiClient(dio: context.read()),),
          Provider(create: (context) => AuthRepository(client: context.read(), secureStorage: context.read()),),
          Provider(create: (context) => UsersRepository(client: context.read())),
          Provider(create: (context) => ReviewsRepository(client: context.read(), secureStorage: context.read())),
          Provider(create: (context) => RecipesRepository(client: context.read())),
          Provider(create: (context) => OnboardingRepository(client: context.read())),
          Provider(create: (context) => CategoriesRepository(client: context.read())),
        ],
        builder: (context, child) => MaterialApp.router(
          theme: themes.lightTheme,
          darkTheme: themes.darkTheme,
          themeMode: context.watch<AppThemeViewModel>().mode,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
