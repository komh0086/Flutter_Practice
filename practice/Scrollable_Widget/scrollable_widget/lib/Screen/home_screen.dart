import 'package:flutter/material.dart';
import 'package:scrollable_widget/Screen/grid_view_screen.dart';
import 'package:scrollable_widget/Screen/refresh_indicator.dart';
import 'package:scrollable_widget/Screen/reorderable_list_view.dart';
import 'package:scrollable_widget/Screen/scroll_bar_screen.dart';
import 'package:scrollable_widget/Screen/single_child_scroll_view.dart';
import 'package:scrollable_widget/layout/main_layout.dart';

import 'custom_scroll_view_screen.dart';
import 'list_view_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({required this.builder, required this.name});
}

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      builder: (_) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollView',
    ),
    ScreenModel(builder: (_) => ListViewScreen(), name: 'ListView'),
    ScreenModel(builder: (_) => GridViewScreen(), name: 'GridView'),
    ScreenModel(
      builder: (_) => ReorderableListViewScreen(),
      name: 'ReorderableScreen',
    ),
    ScreenModel(
        builder: (_) => CustomScrollViewScreen(), name: 'CustomScrollView'),
    ScreenModel(builder: (_) => ScrollbarScreen(), name: 'ScrollBarScreen'),
    ScreenModel(
        builder: (_) => RefreshIndicatorScreen(),
        name: 'RefreshIndicatorScreen'),
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Home',
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screens
              .map((e) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: e.builder),
                      );
                    },
                    child: Text(e.name),
                  ))
              .toList(),
        ));
  }
}
