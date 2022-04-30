import 'package:flutter/material.dart';
class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double? expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var size = 60;
    final top = expandedHeight! - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
     clipBehavior: Clip.none,
      //overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight!;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight!;

  Widget buildAppBar(double shrinkOffset) => Opacity(
    opacity: appear(shrinkOffset),
    child: AppBar(
      backgroundColor: const Color(0xFFff735c),
      automaticallyImplyLeading: false,
      // title: Text(""),
      // centerTitle: true,
    ),
  );

  Widget buildBackground(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Image.network(
      "https://image.tmdb.org/t/p/original/e66tM5YOawXLxhDAfWkR7sxpb3h.jpg",
      fit: BoxFit.cover,
    ),
  );

  Widget buildFloating(double shrinkOffset) => Opacity(
    opacity: disappear(shrinkOffset),
    child: Card(
      child: Row(
        children: [
          Expanded(child: buildButton(text: 'Share', icon: Icons.share, )),
          Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
        ],
      ),
    ),
  );

  Widget buildButton({
    @required String? text,
    @required IconData? icon,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon , color: Colors.red, size: 17,),
            const SizedBox(width: 12),
            Text(text!, style: TextStyle(fontSize: 17, color: Colors.grey)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight!;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
