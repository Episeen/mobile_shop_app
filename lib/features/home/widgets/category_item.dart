import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String iconName;
  final bool isActive;
  final VoidCallback onPressed;

  const CategoryItem(
      {Key? key,
        required this.icon,
        required this.iconName,
        required this.isActive,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 71,
            height: 71,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: isActive ? AppColors.colorOrange : Colors.white,
            ),
            padding: EdgeInsets.all(20),
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : AppColors.colorGrey,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
        Text(
          iconName,
          style: AppTextStyles.txt12w500.copyWith(
            color: isActive ? AppColors.colorOrange : Colors.black,
          ),
        ),
      ],
    );
  }
}