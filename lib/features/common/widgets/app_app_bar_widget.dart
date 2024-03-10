import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppAppBarWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final String? deleteIcon;
  final void Function()? onPressedDelete;

  const AppAppBarWidget({
    required this.title,
    this.onPressed,
    this.deleteIcon,
    this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.blue,
            width: 1.0,
          ),
        ),
      ),
      child: AppBar(
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onPressed,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blue,
            ),
          ),
        ),
        backgroundColor: AppColors.black,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text(
                  title,
                  style: AppTextStyle.medium22.value.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            deleteIcon != null
                ? Expanded(
                    flex: 1,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: onPressedDelete,
                      child: SvgPicture.asset(deleteIcon!),
                    ),
                  )
                : const Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
