import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  Widget child;
  String? title;
  Widget? bottomNavigationBar;

  DefaultLayout(
      {super.key,
      this.bottomNavigationBar,
      this.title,
      required this.child,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      backgroundColor: backgroundColor ?? Colors.white,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          title!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }
  }
}
