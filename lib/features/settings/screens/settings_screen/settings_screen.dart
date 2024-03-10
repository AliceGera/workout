import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/settings/screens/settings_screen/settings_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage(
  name: AppRouteNames.settingsScreen,
)
class SettingsScreen extends ElementaryWidget<ISettingsScreenWidgetModel> {
  const SettingsScreen({
    Key? key,
    WidgetModelFactory wmFactory = settingsScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ISettingsScreenWidgetModel wm) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Настройки',
            style: AppTextStyle.bold32.value.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          CommonWidget(
            title: 'Политика конфиденциальности',
            icon: SvgIcons.security,
            onTap: wm.privacyPolicyOnTap,
            commonIcon: SvgIcons.openArrow,
          ),
          CommonWidget(
            title: 'Пользовательское соглашение',
            icon: SvgIcons.userAgreement,
            onTap: wm.userAgreementOnTap,
            commonIcon: SvgIcons.openArrow,
          ),
          CommonWidget(
            title: 'Оценить приложение',
            icon: SvgIcons.rateApp,
            onTap: wm.onTapAppReview,
            commonIcon: SvgIcons.openArrow,
          ),
          const SizedBox(height: 8),
          CommonWidget(
            title: 'Сбросить данные',
            commonIcon: SvgIcons.refresh,
            onTap: wm.cleanDataBase,
          ),
        ],
      ),
    );
  }
}

class CommonWidget extends StatelessWidget {
  final String title;
  final String? icon;
  final String commonIcon;
  final VoidCallback onTap;

  const CommonWidget({
    super.key,
    required this.title,
   this.icon,
    required this.commonIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 12,horizontal: 12
          ),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon == null ? const SizedBox() : SvgPicture.asset(icon!),
                  const SizedBox(width: 10),
                  Text(title, style: AppTextStyle.medium16.value.copyWith(color: Colors.black)),
                ],
              ),
              SvgPicture.asset(commonIcon),
            ],
          ),
        ),
      ),
    );

  }
}
