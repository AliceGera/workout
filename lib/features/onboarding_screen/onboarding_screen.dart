import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/images.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/common/widgets/app_button_widget.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:workout/features/onboarding_screen/onboarding_screen_widget_model.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

@RoutePage(name: AppRouteNames.onboardingScreen)
class OnboardingScreen extends ElementaryWidget<IOnboardingScreenWidgetModel> {
  const OnboardingScreen({
    Key? key,
    WidgetModelFactory wmFactory = onboardingScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IOnboardingScreenWidgetModel wm) {
    return OnboardingScreenBody(wm: wm);
  }
}

class OnboardingScreenBody extends StatefulWidget {
  final IOnboardingScreenWidgetModel wm;

  const OnboardingScreenBody({
    required this.wm,
    super.key,
  });

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreenBody> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    physics: const BouncingScrollPhysics(),
                    controller: controller,
                    onPageChanged: (idx) {
                      setState(() {
                        index = idx;
                      });
                    },
                    children: const <Widget>[
                      _MainWidget(
                        assetName1: Images.onboarding1_1,
                        assetName2: Images.onboarding1_2,
                        assetName3: Images.onboarding1_3,
                        title: 'Ведите журнал измерений своих параметров и отлеживайте динамику',
                      ),
                      _MainWidget(
                        assetName1: Images.onboarding2_1,
                        assetName2: Images.onboarding2_2,
                        assetName3: Images.onboarding2_3,
                        title: 'Составляйте тренировки и упражнения исходя из ваших целей и потребностей',
                      ),
                      _MainWidget(
                        assetName1: Images.onboarding3_1,
                        assetName2: Images.onboarding3_2,
                        assetName3: Images.onboarding3_3,
                        title: 'Календарь ваших тренировок всегда под рукой. Редактируйте расписание когда это необходимо',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButtonWidget(
                          title: 'Пропустить',
                          color: AppColors.white,
                          textColor: Colors.black,
                          onPressed: () async {
                            await widget.wm.finishOnboarding();
                            widget.wm.openTemp();
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AppButtonWidget(
                          title: 'Далее',
                          color: AppColors.blue,
                          onPressed: () async {
                            if (index == 2) {
                              await widget.wm.finishOnboarding();
                              widget.wm.openTemp();
                            } else {
                              index++;
                              controller.jumpToPage(index);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: widget.wm.userAgreementOnTap,
                      child: Text(
                        'Условия использования',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.light10.value.copyWith(color: AppColors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        color: AppColors.blue,
                        height: 12,
                        width: 1,
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: widget.wm.privacyPolicyOnTap,
                      child: Text(
                        'Политика конфиденциальности',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.light10.value.copyWith(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MainWidget extends StatelessWidget {
  const _MainWidget({
    required this.assetName1,
    required this.assetName2,
    required this.assetName3,
    required this.title,
  });

  final String assetName1;
  final String assetName2;
  final String assetName3;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SizedBox(
            height: 200,
            child: Text(
              title,
              style: AppTextStyle.semiBold28.value.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        assetName1,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.asset(
                        assetName2,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Image.asset(
                        assetName3,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
