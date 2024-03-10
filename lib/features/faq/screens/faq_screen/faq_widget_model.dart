import 'package:workout/features/faq/screens/faq_screen/faq_screen.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'faq_model.dart';

FaqScreenWidgetModel faqScreenWidgetModelFactory(
  BuildContext context,
) {
  final model = FaqScreenModel();
  return FaqScreenWidgetModel(model);
}

abstract interface class IFaqScreenWidgetModel implements IWidgetModel {}

class FaqScreenWidgetModel extends WidgetModel<FaqScreen, FaqScreenModel> implements IFaqScreenWidgetModel {
  FaqScreenWidgetModel(super._model);
}

