import 'package:auto_route/auto_route.dart';
import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:workout/features/faq/screens/faq_screen/faq_widget_model.dart';
import 'package:workout/features/navigation/domain/entity/app_route_names.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage(
  name: AppRouteNames.faqScreen,
)
class FaqScreen extends ElementaryWidget<IFaqScreenWidgetModel> {
  FaqScreen({
    Key? key,
    WidgetModelFactory wmFactory = faqScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);
  List<String> faqList = [
    'Какую роль играет правильное питание при наборе веса?',
    'Какая роль тренировок силовых упражнений в наборе мышечной массы?',
    'Как часто следует тренироваться для набора веса?',
    'Какой подход к тренировкам эффективен для набора веса?',
    'Какую роль играет питьевой режим при наборе веса?',
    'Как долго может занять время, чтобы увидеть результаты набора веса?',
    'Есть ли какие-либо рекомендации для эффективного набора веса?',
  ];
  List<String> faqDescriptionList = [
    'Правильное питание является ключевым элементом для набора веса, поскольку оно обеспечивает организм необходимыми питательными веществами и энергией для '
        'роста мышц. Рекомендуется потреблять калорийный избыток, увеличивая потребление белка, углеводов и здоровых жиров.',
    'Роль тренировок силовых упражнений в наборе мышечной массы заключается в стимуляции роста мышц за счет увеличения объема и силы мышечных волокон. Силовые тренировки способствуют развитию мышц, улучшению метаболизма и формированию более выразительной фигуры.',
    'Частота тренировок для набора веса зависит от индивидуальных целей, физической подготовки и возможностей организма. Обычно для эффективного набора веса рекомендуется тренироваться от 3 до 5 раз в неделю, предоставляя достаточное время для восстановления и роста мышц.',
    'Эффективным подходом к тренировкам для набора веса является комбинация силовых упражнений с использованием свободных весов и тренажеров, правильное питание, регулярные тренировки с увеличением нагрузки и отдыхом между подходами.',
    'Питьевой режим играет важную роль при наборе веса, поскольку увеличение мышечной массы требует достаточного увлажнения организма. Рекомендуется употреблять достаточное количество воды в течение дня, особенно во время тренировок, чтобы поддерживать оптимальный обмен веществ и ускорить процесс набора веса.',
    'Время, необходимое для увидения результатов набора веса, может варьироваться в зависимости от многих факторов, таких как интенсивность тренировок, питание, генетика и общее состояние организма. Обычно видимые изменения можно заметить через несколько недель до нескольких месяцев систематических тренировок и правильного питания.',
    'Для эффективного набора веса рекомендуется следовать плану тренировок и питания, уделять внимание отдыху и восстановлению, а также консультироваться с тренером или диетологом для разработки индивидуальной программы.',
  ];
  List<String> faqCountList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  @override
  Widget build(IFaqScreenWidgetModel wm) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQ',
              style: AppTextStyle.bold32.value.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: faqList.length,
              itemBuilder: (context, index) => FaqWidget(
                faq: faqList[index],
                faqDescription: faqDescriptionList[index],
                faqCount: faqCountList[index],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FaqWidget extends StatefulWidget {
  FaqWidget({
    super.key,
    required this.faq,
    required this.faqDescription,
    required this.faqCount,
  });

  String faq;
  String faqDescription;
  String faqCount;

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Row(
            children: [
              Text(
                widget.faqCount,
                style: AppTextStyle.bold32.value.copyWith(color: AppColors.blue),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  maxLines: 2,
                  widget.faq,
                  style: AppTextStyle.medium16.value,
                ),
              ),
            ],
          ),
          trailing: SvgPicture.asset(
            SvgIcons.openArrow,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text(
                widget.faqDescription,
                style: AppTextStyle.regular12.value,
              ),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() {});
          },
        ),
      ),
    );
  }
}
