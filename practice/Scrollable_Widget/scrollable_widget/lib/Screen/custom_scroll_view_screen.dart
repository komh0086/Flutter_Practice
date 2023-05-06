import 'package:flutter/material.dart';
import 'package:scrollable_widget/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대높이
  double get maxExtent => maxHeight;

  @override
  // 최소높이
  double get minExtent => minHeight;

  @override
  //covariant - oldDelegate가 SliverPersistentHeaderDelegate클래스를 상속받은 클래스로 들어와도 된다는 것을 의미
  //oldDelegate - setState와 같은 함수가 실행되어 rebuild될때의 기존의 delegate
  //this - 새로운 Delegate
  //souldRebuild - 새로 build를 할지말지 결정
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minExtent != minHeight ||
        oldDelegate.maxExtent != maxHeight ||
        oldDelegate.child != child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppbar(),
          renderSliverPersistentHeader(),
          renderChildSliverListBuilder(),
          renderChildSliverGrid(),
          renderChildSliverList(),
        ],
      ),
    );
  }

  SliverPersistentHeader renderSliverPersistentHeader() {
    return SliverPersistentHeader(
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
        ),
        maxHeight: 150,
        minHeight: 75,
      ),
    );
  }

  SliverAppBar renderSliverAppbar() {
    return const SliverAppBar(
      floating: true, //스크롤을 중간에서 조금만 올려도 앱바가 보임
      pinned: true, //true로 하면 무조건 상단에 고정
      snap: true, //스크롤을 조금만할때 자석효과 floating이 true일때만 사용가능
      stretch: true, //스크롤을 한계 이상으로 올리려고 하면 AppBar가 늘어남
      expandedHeight: 200, //늘어나는 길이 지정
      collapsedHeight: 100, //AppBar의 title이 위로 올라가는 길이 지정
      flexibleSpace: FlexibleSpaceBar(
        background: null, //늘어난 앱바의 배경을 지정할 수 있음
        title: Text('FlexibleSpace'), //늘어난 앱바 부분
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
        delegate: SliverChildListDelegate(
          numbers
              .map((e) => renderContainer(
                  color: rainbowColors[e % rainbowColors.length], index: e))
              .toList(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //가로 위젯 갯수 제한, SliverGridDelegateWithMaxCrossAxisExtent - 위젯들의 최대 가로길이 제한
          crossAxisCount: 2,
        ));
  }

  SliverList renderChildSliverListBuilder() {
    return SliverList(
      //SliverChildBuilderDelegate - 화면에 보이는 위젯들만 생성하고 안보이는 것들은 지움
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
              color: rainbowColors[index % rainbowColors.length], index: index);
        },
        childCount: 100, //생성할 아이템의 개수 지정가능
      ),
    );
  }

  SliverList renderChildSliverList() {
    return SliverList(
        //SliverChildListDelegate - 모든 위젯을 생성하는 방식 리소스 낭비가 생길 수 있음
        delegate: SliverChildListDelegate(numbers
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList()) //어떤형태로 SliverList를 구성할지
        );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    return Container(
      key: Key(index.toString()), //각각의 컨테이너가 다드게 인식할수 있도록
      height: height ?? 300,
      color: color ?? Colors.black,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
