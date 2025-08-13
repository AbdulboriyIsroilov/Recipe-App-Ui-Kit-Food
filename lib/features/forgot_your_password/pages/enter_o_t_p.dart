import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_colors.dart';
import 'package:recipe_app_ui_kit_food/core/utils/app_style.dart';
import 'package:recipe_app_ui_kit_food/features/common/widgets/text_buttom_popular.dart';
import 'package:recipe_app_ui_kit_food/features/forgot_your_password/widgets/forgot_your_password_texts.dart';

class EnterOTP extends StatefulWidget {
  const EnterOTP({Key? key}) : super(key: key);

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          "Forgot your password",
          style: AppStyle.w600s20wr,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 51.h),
        child: Column(
          spacing: 53.h,
          children: [
            ForgotYourPasswordTexts(
              title1: "You’ve got mail",
              title2:
                  "We will send you the verification code to your email address, check your email and put the code right below .",
            ),
            Column(
              spacing: 76.22.h,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(6, (index) {
                      return TextField(
                        // controller: controller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          constraints: BoxConstraints.tight(Size.square(40.r,)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: AppColors.watermelonRed,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: AppColors.watermelonRed,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide: BorderSide(
                              color: AppColors.watermelonRed,
                              width: 2,
                            ),
                          ),
                          counter: SizedBox.shrink()
                        ),
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        style: AppStyle.w600s20w,
                      );
                    }),
                  ],
                ),
                SizedBox(
                  width: 176.w,
                  height: 63.h,
                  child: Text(
                    "Didn’t receive the mail? You can resend it in 49 sec",
                    style: AppStyle.w400s13.copyWith(color: AppColors.white),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButtomPopular(title: "continue"),
          ],
        ),
      ),
    );
  }
}
