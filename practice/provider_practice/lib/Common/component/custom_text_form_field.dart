import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  CustomTextFormField({
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
      color: INPUT_BORDER_COLOR,
      width: 1,
    ));
    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText, //true - 비밀번호 입력할 때
      autofocus: autofocus, //true - 위젯이 실행될 때 자동으로 커서가 올라감
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20),
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(color: BODY_TEXT_COLOR, fontSize: 14),
          fillColor: INPUT_BG_COLOR,
          filled: true, //false - 배경색 없음, true - 배경색 있음
          border: baseBorder, //모든 input 상태의 기본 스타일 세팅
          enabledBorder: baseBorder,
          focusedBorder: baseBorder.copyWith(
            borderSide: baseBorder.borderSide.copyWith(
              color: PRIMARY_COLOR,
            ),
          )),
    );
  }
}
