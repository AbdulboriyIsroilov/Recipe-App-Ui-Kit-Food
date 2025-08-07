import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cooking_level_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cuisines_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_list_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_page.dart';

import '../../features/on_boarding/pages/allergic_page.dart';

class Routers {
  GoRouter router = GoRouter(
    redirect: (context, state) {},
    initialLocation: RouterNames.onBoardingCookingLevelPage,

    routes: <RouteBase>[
      GoRoute(
        path: RouterNames.onBoardingCookingLevelPage,
        builder: (context, state) => CookingLevelPage(),
      ),
      GoRoute(
        path: RouterNames.onBoardingPreferencesPage,
        builder: (context, state) => CuisinesPage(),
      ),
      GoRoute(
        path: RouterNames.onBoardingAllergicPage,
        builder: (context, state) => AllergicPage(),
      ),
      GoRoute(
        path: RouterNames.recipePage,
        builder: (context, state) => RecipePage(),
      ),
      GoRoute(
        path: RouterNames.recipeListPage,
        builder: (context, state) => RecipeListPage(
          appBarTitle: (state.extra as Map)["appBarTitle"],
          categoryId: (state.extra as Map)["categoryId"],
        ),
      ),
      GoRoute(
        path: RouterNames.recipeDetailPage,
        builder: (context, state) => RecipeDetailPage(
          title: (state.extra as Map)["title"],
          categoryId: (state.extra as Map)["categoryId"],
        ),
      ),
    ],
  );
}
