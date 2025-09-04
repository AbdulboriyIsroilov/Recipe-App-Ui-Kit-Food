import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_svg.dart';
import 'package:recipe_app_ui_kit_food/features/add_recipe/widgets/build_text_field.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/app_bar_common.dart';
import 'package:recipe_app_ui_kit_food/features/logi_sign_up/widgets/text_field_not_pasword.dart';

import '../../../core/utils/app_style.dart';
import '../../common/widgets/bottom_navigation_bar_gradient.dart';
import '../../common/widgets/bottom_navigation_bar_main.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  List<TextEditingController> ingredientControllers = [];
  List<TextEditingController> instructionControllers = [];
  List<TextEditingController> amountControllers = [];

  @override
  void initState() {
    super.initState();
    ingredientControllers = List.generate(5, (i) => TextEditingController());
    instructionControllers = List.generate(5, (i) => TextEditingController());
    amountControllers = List.generate(5, (i) => TextEditingController());
  }

  Widget _buildIngredientField(TextEditingController controller, TextEditingController amtController) {
    return Row(
      spacing: 7.w,
      children: [
        SvgPicture.asset(AppSvgs.threeDots),
        SizedBox(
          width: 70.w,
          child: buildTextField(
            hint: "Amt",
            controller: amtController,
          ),
        ),
        Expanded(
          child: buildTextField(hint: "Ingredient", controller: controller),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.pastelPink,
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.w),
          ),
          icon: SvgPicture.asset(AppSvgs.bin),
          onPressed: () {
            setState(() {
              ingredientControllers.remove(controller);
            });
          },
        ),
      ],
    );
  }

  Widget _buildInstructionField(TextEditingController controller) {
    return Row(
      spacing: 7.w,
      children: [
        SvgPicture.asset(AppSvgs.threeDots),
        Expanded(
          child: buildTextField(hint: "Instruction", controller: controller),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.pastelPink,
            shape: CircleBorder(),
            padding: EdgeInsets.all(15.w),
          ),
          icon: SvgPicture.asset(AppSvgs.bin),
          onPressed: () {
            setState(() {
              instructionControllers.remove(controller);
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBarCommon(
        title: "Create Recipe",
        action: false,
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(35.w, 26.h, 35.w, 126.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
                    height: 281.h,
                    width: 362.w,
                    fit: BoxFit.cover,
                  ),
                  CircleAvatar(
                    radius: 35.32.r,
                    backgroundColor: AppColors.watermelonRed,
                    child: SvgPicture.asset(AppSvgs.play),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextFieldNotPasword(
              controller: titleController,
              text: "Title",
              hint: "Pina Colada",
            ),
            TextFieldNotPasword(
              controller: descriptionController,
              text: "Description",
              hint: "A tropical explosion in every sip",
              maxLine: 2,
            ),
            TextFieldNotPasword(
              controller: timeController,
              text: "Time Recipe",
              hint: "30min",
            ),

            SizedBox(height: 12),
            Text("Ingredients", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 8),
            Column(
              children: List.generate(
                ingredientControllers.length,
                (index) {
                  return _buildIngredientField(
                    ingredientControllers[index],
                    amountControllers[index],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    ingredientControllers.add(TextEditingController());
                  });
                },
                icon: Icon(Icons.add, color: AppColors.backgroundColor),
                label: Text(
                  "Add Ingredient",
                  style: AppStyles.w500s15.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.watermelonRed,
                  fixedSize: Size(211.w, 35.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),
            Text("Instructions", style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 8),
            Column(children: instructionControllers.map(_buildInstructionField).toList()),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    instructionControllers.add(TextEditingController());
                  });
                },
                icon: Icon(Icons.add, color: AppColors.backgroundColor),
                label: Text(
                  "Add Ingredient",
                  style: AppStyles.w500s15.copyWith(
                    color: AppColors.backgroundColor,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.watermelonRed,
                  fixedSize: Size(211.w, 35.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBarGradient(),
          BottomNavigationBarMain(),
        ],
      ),
    );
  }
}
