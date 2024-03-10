import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppMainWidget extends StatelessWidget {
  final String title;
  final bool isAddIcon;
  final VoidCallback? openAddObjectScreen;

  const AppMainWidget({
    super.key,
    required this.title,
    this.isAddIcon = false,
    this.openAddObjectScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 54,
          width: 2,
          color: Colors.black,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyle.bold32.value.copyWith(
            color: Colors.white,
            shadows: [
              const Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
              const Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
              const Shadow(offset: Offset(0.5, 0.5), color: Colors.black),
              const Shadow(offset: Offset(-0.5, 0.5), color: Colors.black),
            ],
          ),
        ),
        const Spacer(),
        isAddIcon
            ? InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
                onTap: openAddObjectScreen,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(SvgIcons.weight),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
