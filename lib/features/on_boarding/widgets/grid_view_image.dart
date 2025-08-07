import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_ui_kit_food/features/on_boarding/manegers/cuisines_view_model.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_style.dart';
import '../../../core/utils/app_svg.dart';
import '../../common/widgets/text_buttom_popular.dart';
import 'scroll_conteyner.dart';

class GridViewImage extends StatefulWidget {
  const GridViewImage({
    super.key,
    required this.vm,
    required this.index,
    this.defaultBorderColor = Colors.transparent,
  });

  final List vm;
  final int index;
  final Color defaultBorderColor;

  @override
  State<GridViewImage> createState() => _GridViewImageState();
}

class _GridViewImageState extends State<GridViewImage> {
  bool buttom = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttom = !buttom;
        setState(() {});
      },
      child: Column(
        spacing: 6.18,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11.74.r),
              border: BoxBorder.all(
                width: 1.3,
                color: buttom
                    ? Colors.green
                    : widget.defaultBorderColor,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11.8.r),
              child: Image.network(
                widget.vm[widget.index].image,
                width: 98.23.w,
                height: 98.63.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.vm[widget.index].title,
            style: AppStyle.w500s13w,
          ),
        ],
      ),
    );
  }
}
