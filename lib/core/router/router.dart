import 'package:go_router/go_router.dart';
import 'package:recipe_app_ui_kit_food/core/router/routers.dart';
import 'package:recipe_app_ui_kit_food/features/Community/pages/community_page.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/enter_o_t_p.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/pages/forgot_email.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/login_page.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/pages/sign_up_page.dart';
import 'package:recipe_app_ui_kit_food/features/my_recipes/pages/my_recipes_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cooking_level_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/cuisines_page.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/on_boarding.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/pages/welcome_page.dart';
import 'package:recipe_app_ui_kit_food/features/profile/pages/notification_page.dart';
import 'package:recipe_app_ui_kit_food/features/profile/pages/profile_page.dart';
import 'package:recipe_app_ui_kit_food/features/profile/pages/settings_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/recipe_list_page.dart';
import 'package:recipe_app_ui_kit_food/features/recipe/pages/categoty_page.dart';
import 'package:recipe_app_ui_kit_food/features/reviews/pages/reviews_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_detail_page.dart';
import 'package:recipe_app_ui_kit_food/features/top_chef/pages/top_chef_page.dart';
import 'package:recipe_app_ui_kit_food/features/trending_recipes/pages/trending_recipes_page.dart';

import '../../features/add_recipe/pages/add_recipe_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/splash_page.dart';
import '../../features/on_boarding/pages/allergic_page.dart';
import '../../features/reviews/pages/reviews_add_page.dart';

final router = GoRouter(
  initialLocation: Routers.settings,

  routes: <RouteBase>[
    GoRoute(
      path: Routers.splash,
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: Routers.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routers.myRecipe,
      builder: (context, state) => MyRecipesPage(),
    ),
    GoRoute(
      path: Routers.profile,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: Routers.settings,
      builder: (context, state) => SettingsPage(),
    ),
    GoRoute(
      path: Routers.notification,
      builder: (context, state) => NotificationPage(),
    ),
    GoRoute(
      path: Routers.addRecipe,
      builder: (context, state) => AddRecipe(),
    ),
    GoRoute(
      path: Routers.topChefs,
      builder: (context, state) => TopChefPage(),
    ),
    GoRoute(
      path: Routers.topChefDetail,
      builder: (context, state) => TopChefDetailPage(id: (state.extra as Map)["id"]),
    ),
    GoRoute(
      path: Routers.trendingRecipes,
      builder: (context, state) => TrendingRecipesPage(),
    ),
    GoRoute(
      path: Routers.forgotPassword,
      builder: (context, state) => ForgotEmail(),
    ),
    GoRoute(
      path: Routers.enterOTP,
      builder: (context, state) => EnterOTP(),
    ),
    GoRoute(
      path: Routers.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: Routers.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routers.onboarding,
      builder: (context, state) => OnBoarding(),
    ),
    GoRoute(
      path: Routers.welcome,
      builder: (context, state) => WelcomePage(),
    ),
    GoRoute(
      path: Routers.onBoardingCookingLevelPage,
      builder: (context, state) => CookingLevelPage(),
    ),
    GoRoute(
      path: Routers.onBoardingPreferencesPage,
      builder: (context, state) => CuisinesPage(),
    ),
    GoRoute(
      path: Routers.onBoardingAllergicPage,
      builder: (context, state) => AllergicPage(),
    ),
    GoRoute(
      path: Routers.categoryPage,
      builder: (context, state) => CategoryPage(),
    ),
    GoRoute(
      path: Routers.recipeListPage,
      builder: (context, state) => RecipeListPage(
        appBarTitle: (state.extra as Map)["appBarTitle"],
        categoryId: (state.extra as Map)["categoryId"],
      ),
    ),
    GoRoute(
      path: Routers.recipeDetailPage,
      builder: (context, state) => RecipeDetailPage(
        title: (state.extra as Map)["title"],
        categoryId: (state.extra as Map)["categoryId"],
      ),
    ),
    GoRoute(
      path: Routers.reviewsPage,
      builder: (context, state) => ReviewsPage(
        categoriyId: (state.extra as Map)["categoriyId"],
      ),
    ),
    GoRoute(
      path: Routers.reviewsAddPage,
      builder: (context, state) => ReviewsAddPage(
        categoriyId: (state.extra as Map)["categoriyId"],
      ),
    ),
    GoRoute(
      path: Routers.community,
      builder: (context, state) => CommunityPage(),
    ),
  ],
);
