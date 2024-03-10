import 'package:workout/assets/colors/app_colors.dart';
import 'package:workout/assets/text/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldWidget extends StatefulWidget {
  const AppTextFieldWidget({
     this.text='',
    this.formKey,
    this.controller,
    super.key,
    this.validatorText,
    this.lines = 1,
    this.isPrice = false,
    this.keyboardType,
    this.inputFormatters,
    this.labelText = 'labelText',
     this.hintText= 'hintText',
  });

  final GlobalKey<FormState>? formKey;
  final TextEditingController? controller;
  final int lines;
  final bool isPrice;
  final String text;
  final String  hintText;
  final String labelText;
  final String? Function()? validatorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  final FocusNode _focus = FocusNode();

  bool isFocused = false;
  bool isShowFloatingLabel = false;
  bool textIsNotEmpty = false;

  void listener() {
    setState(() {
      textIsNotEmpty = widget.controller!.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    _focus.addListener(_onFocusChange);
    widget.controller?.addListener(listener);
    listener();
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.removeListener(listener);
    _focus
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focus.hasFocus;
    });
  }

  late Widget widgetStack = Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          maxLines: widget.lines,
          style: AppTextStyle.regular14.value.copyWith(color: Colors.black),
          validator: (value) {
            return widget.validatorText?.call() != null ? '' : null;
          },
          focusNode: _focus,
          controller: widget.controller,
          decoration:  InputDecoration(
            // border: const UnderlineInputBorder(),
            hintText: widget.hintText,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blue,
              ),
            ),
            focusedBorder:const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blue,
              ),
            ),
            border:const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blue,
              ),
            ),
            //labelText: widget.labelText,
          )));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        child: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.labelText,
                style: AppTextStyle.semiBold24.value.copyWith(
                  color: AppColors.blue,
                ),
              ),
              widgetStack,
            ],
          ),
        ),
      ),
    );
  }
}
