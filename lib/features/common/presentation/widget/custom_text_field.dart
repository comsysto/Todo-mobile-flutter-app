import 'package:flutter/material.dart';
import 'package:todo_app/core/style/colors.dart';
import 'package:todo_app/core/style/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: formTextSyle,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: foregroundColor,
        alignLabelWithHint: true,
        isDense: true,
        suffixIcon: suffixIcon,
        suffixIconColor: labelColor,
        label: Text(
          labelText,
          style: formTextSyle.copyWith(color: labelColor),
        ),
        border: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        enabledBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        focusedBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: foregroundColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorBorder: DecoratedInputBorder(
          shadow: const BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            offset: Offset(1, 5),
          ),
          child: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: redColor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        errorStyle: errorTextStyle,
      ),
      validator: validator,
    );
  }
}

class DecoratedInputBorder extends InputBorder {
  DecoratedInputBorder({
    required this.child,
    required this.shadow,
  }) : super(borderSide: child.borderSide);

  final InputBorder child;

  final BoxShadow shadow;

  @override
  bool get isOutline => child.isOutline;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      child.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      child.getOuterPath(rect, textDirection: textDirection);

  @override
  EdgeInsetsGeometry get dimensions => child.dimensions;

  @override
  InputBorder copyWith(
      {BorderSide? borderSide, InputBorder? child, BoxShadow? shadow, bool? isOutline}) {
    return DecoratedInputBorder(
      child: (child ?? this.child).copyWith(borderSide: borderSide),
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ShapeBorder scale(double t) {
    final scalledChild = child.scale(t);

    return DecoratedInputBorder(
      child: scalledChild is InputBorder ? scalledChild : child,
      shadow: BoxShadow.lerp(null, shadow, t)!,
    );
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double? gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection? textDirection}) {
    final clipPath = Path()
      ..addRect(const Rect.fromLTWH(-5000, -5000, 10000, 10000))
      ..addPath(getInnerPath(rect), Offset.zero)
      ..fillType = PathFillType.evenOdd;
    canvas.clipPath(clipPath);

    final Paint paint = shadow.toPaint();
    final Rect bounds = rect.shift(shadow.offset).inflate(shadow.spreadRadius);

    canvas.drawPath(getOuterPath(bounds), paint);

    child.paint(canvas, rect,
        gapStart: gapStart,
        gapExtent: gapExtent,
        gapPercentage: gapPercentage,
        textDirection: textDirection);
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is DecoratedInputBorder &&
        other.borderSide == borderSide &&
        other.child == child &&
        other.shadow == shadow;
  }

  @override
  int get hashCode => Object.hash(borderSide, child, shadow);
}
