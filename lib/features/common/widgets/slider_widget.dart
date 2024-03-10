import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
import 'package:workout/assets/text/text_style.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({
    required this.measure,
    required this.value,
    required this.valueStr,
    required this.onChanged,
    this.interval = 1,
    super.key,
  });

  final String measure;
  final double value;
  final String valueStr;
  final void Function(double) onChanged;
  final double interval;

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  late WeightSliderController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(
      initialWeight: widget.value,
      minWeight: 0,
      interval: widget.interval,
      itemExtent: 30,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalWeightSlider(
          isVertical: false,
          controller: _controller,
          decoration: const PointerDecoration(
            width: 40,
            height: 2.5,
            largeColor: Colors.black,
            mediumColor: Colors.black,
            smallColor: Colors.black,
            gap: 8,
          ),
          onChanged: widget.onChanged,
          height: 65,
          maxWeight: 270,
          diameterRatio: 4,
          indicator: Container(
            height: 5,
            width: 40,
            alignment: Alignment.center,
            color: const Color(0xFFF15452),
          ),
        ),
        Text(
          '${widget.valueStr} ${widget.measure}',
          style: AppTextStyle.regular15.value.copyWith(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
