import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/res/svg_icons.dart';
import 'package:workout/assets/text/text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.infoText,
    required this.title,
    required this.background,
    required this.onChanged,
    required this.initialValue,
  });

  final String infoText;
  final String title;
  final Color background;
  final int initialValue;
  final void Function(int) onChanged;

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  void initState() {
    count = widget.initialValue;
    super.initState();
  }

  void incrementCount() {
    setState(() {
      count++;
    });
    widget.onChanged.call(count);
  }

  void decrementCount() {
    if (count != 0) {
      setState(() {
        count--;
      });
      widget.onChanged.call(count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: widget.background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                widget.title,
                style: AppTextStyle.regular24.value,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: decrementCount,
                          child: SvgPicture.asset(SvgIcons.decrement),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              child: Text(
                                '$count см',
                                style: AppTextStyle.regular14.value,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: incrementCount,
                          child: SvgPicture.asset(SvgIcons.increment),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(SvgIcons.infoCircle),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    widget.infoText,
                    style: AppTextStyle.light12.value,
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
