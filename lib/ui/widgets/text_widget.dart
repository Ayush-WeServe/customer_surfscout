import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final int? maxLine;
  final bool? softwrap;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const TextWidget(
      {super.key,
      required this.text,
      this.style,
      this.maxLine,
      this.softwrap,
      this.overflow = TextOverflow.ellipsis,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: style,
      maxLines: maxLine,
      softWrap: softwrap,
      overflow: overflow,
    );
  }
}
