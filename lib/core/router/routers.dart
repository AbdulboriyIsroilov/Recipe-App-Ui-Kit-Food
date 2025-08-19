import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/router_names.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/enter_o_t_p.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/forgot_email.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/login_page.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/sign_up_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cooking_level_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cuisines_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/on_boarding.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/welcome_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_list_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_page.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/pages/reviews_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_page.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/pages/trending_recipes_page.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../../features/on_boarding/pages/allergic_page.dart';

class Routers {
  GoRouter router = GoRouter(
    redirect: (context, state) {},
    initialLocation: RouterNames.recipePage,

    routes: <RouteBase>[
      GoRoute(
        path: RouterNames.splash,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: RouterNames.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: RouterNames.topChefs,
        builder: (context, state) => TopChefPage(),
      ),
      GoRoute(
        path: RouterNames.topChefDetail,
        builder: (context, state) =>
            TopChefDetailPage(id: (state.extra as Map)["id"]),
      ),
      GoRoute(
        path: RouterNames.trendingRecipes,
        builder: (context, state) => TrendingRecipesPage(),
      ),
      GoRoute(
        path: RouterNames.forgotPassword,
        builder: (context, state) => ForgotEmail(),
      ),
      GoRoute(
        path: RouterNames.enterOTP,
        builder: (context, state) => EnterOTP(),
      ),
      GoRoute(
        path: RouterNames.login,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: RouterNames.signUp,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: RouterNames.onBoarding,
        builder: (context, state) => OnBoarding(),
      ),
      GoRoute(
        path: RouterNames.welcome,
        builder: (context, state) => WelcomePage(),
      ),
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
      GoRoute(
        path: RouterNames.reviewsPage,
        builder: (context, state) => ReviewsPage(
          categoriyId: (state.extra as Map)["categoriyId"],
        ),
      ),
    ],
  );
}
