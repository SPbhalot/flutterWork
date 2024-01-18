import 'package:flutter/material.dart';

TextStyle bottomNavTextStyle({required Color color}) {
  return TextStyle(
    fontSize: 14,
    color: color,
  );
}

InputDecoration formFieldInputDecorationAlt(
    {required String hintText, required String labelText}) {
  return InputDecoration(
    floatingLabelStyle: const TextStyle(
      color: Color(0xff3F7ED3),
    ),
    labelText: labelText,
    hintText: hintText,
    focusedBorder: formBorder(isFocused: true),
    border: formBorder(),
    enabledBorder: formBorder(),
  );
}

TextStyle sectionTitleStyle() {
  return const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
}

TextStyle miniTitleStyle({Color? textColor}) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor ?? Colors.black,
  );
}

TextStyle megaTitleStyle({Color? textColor}) {
  return TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: textColor ?? const Color(0xff222222),
  );
}

TextStyle sectionTextStyle({Color? textColor, bool? isBold}) {
  return TextStyle(
    fontSize: 15,
    fontWeight: isBold == true ? FontWeight.w800 : FontWeight.w400,
    color: textColor ?? const Color(0xff333333),
  );
}

TextStyle InfoLabelHeader() {
  return const TextStyle(
    height: 2,
    fontSize: 15,
    color: Color(0xff6F6F6F),
  );
}

TextStyle InfoLabelTitle({Color? color}) {
  return TextStyle(
    fontFamily: 'RobotoCondensed',
    fontSize: 16,
    height: 1.5,
    color: color ?? Colors.black,
  );
}

OutlineInputBorder formBorder({bool? isFocused}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color:
          isFocused == true ? const Color(0xff3F7ED3) : const Color(0xffF4F2F2),
      width: 1,
      style: BorderStyle.solid,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

InputDecoration formFieldInputDecoration() {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusedBorder: formBorder(isFocused: true),
    enabledBorder: formBorder(),
    border: formBorder(),
    contentPadding: EdgeInsets.zero,
  );
}
