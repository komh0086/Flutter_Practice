import 'dart:convert';

import 'package:actual/Common/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Common/component/custom_text_form_field.dart';
import '../../Common/const/colors.dart';
import '../../Common/const/data.dart';
import '../../Common/layout/default_layout.dart';
import '../../Common/view/root_tab.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
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
                  username = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  obscureText: true,
                  onChanged: (String value) {
                    password = value;
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
                onPressed: onRegistPressed,
                child: const Text('회원가입'),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void onRegistPressed() async {}

  void onLoginPressed() async {
    final dio = Dio();

    final storage = ref.read(secureStorageProvider);

    String rawString = username + ':' + password;
    Codec<String, String> stirngToBase64 =
        utf8.fuse(base64); //base64로 Encodeing
    String token = stirngToBase64.encode(rawString);

    var response = await dio.post('http://$IP/auth/login',
        options: Options(headers: {'authorization': 'Basic $token'}));

    final refreshToken = response.data['refreshToken'];
    final accessToken = response.data['accessToken'];

    await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
    await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

    Navigator.of(context).push(MaterialPageRoute(builder: (_) => RootTab()));
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
