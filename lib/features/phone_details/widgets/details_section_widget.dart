import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_styles.dart';

class DetailsSection extends StatefulWidget {
  final String svgPicture;
  final String text;

  const DetailsSection({Key? key, required this.svgPicture, required this.text})
      : super(key: key);

  @override
  State<DetailsSection> createState() => _DetailsSectionState();
}

class _DetailsSectionState extends State<DetailsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(widget.svgPicture, height: 28),
        SizedBox(height: 5),
        Text(
          widget.text,
          style: AppTextStyles.txt11w400.copyWith(
            color: AppColors.colorGrey,
          ),
        )
      ],
    );
  }
}