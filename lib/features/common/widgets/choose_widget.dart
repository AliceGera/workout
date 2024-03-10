import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({
    required this.text,
    required this.fieldName,
    required this.assetName,
    this.isEdit = false,
    super.key,
  });

  final String fieldName;
  final String text;
  final String assetName;

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
         // border: Border.all(color: color, width: 0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(fieldName, style: AppTextStyle.semiBold24.value.copyWith(color: AppColors.blue)),
              Row(
                children: [
                  Text(text, style: AppTextStyle.regular14.value.copyWith(color: AppColors.black)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(assetName),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
