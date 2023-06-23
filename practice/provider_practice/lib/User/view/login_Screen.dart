import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider_practice/Common/const/colors.dart';
import 'package:provider_practice/Common/layout/default_layout.dart';

import '../../Common/component/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var ID = "";
    var PW = "";
    return DefaultLayout(
        child: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Title(),
              const SizedBox(
                height: 16,
              ),
              _SubTitle(),
              const SizedBox(
                height: 16,
              ),
              Image.asset('assets/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: '이메일을 입력해주세요.',
                onChanged: (String value) {
                  ID = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  obscureText: true,
                  onChanged: (String value) {
                    PW = value;
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
                onPressed: onLoginPressed,
                child: const Text('로그인'),
              ),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
                child: const Text('회원가입'),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void onLoginPressed() async {
    final dio = Dio();

    const IP = '127.0.0.1:3000';
    const rawString = 'test@codefactory.ai:testtest';
    Codec<String, String> stirngToBase64 = utf8.fuse(base64);
    String token = stirngToBase64.encode(rawString);
    print('$IP');
    var response = await dio.post('http://$IP/auth/login',
        options: Options(headers: {'authorization': 'Basic $token'}));
    print(response.statusCode);
    print(response.data);
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w700, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길 :)',
        style: TextStyle(fontSize: 16, color: BODY_TEXT_COLOR));
  }
}
