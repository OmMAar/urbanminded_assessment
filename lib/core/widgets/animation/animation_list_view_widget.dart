import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationListViewWidget<T> extends StatelessWidget {
  final Duration duration;
  final Curve curve;
  final double verticalOffset;
  final double horizontalOffset;
  final EdgeInsetsGeometry? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Axis scrollDirection;
  final List<T> items;
  final int itemPlus;
  final bool isSeparated;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;

  const AnimationListViewWidget({
    Key? key,
    this.physics,
    this.shrinkWrap = false,
    this.isSeparated = false,
    this.separatorBuilder ,
    this.verticalOffset = 0.0,
    this.itemPlus = 0,
    this.horizontalOffset = 0.0,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.duration = const Duration(milliseconds: 225),
    required this.items,
    required this.itemBuilder,
    this.curve = Curves.ease,
  }) : assert(isSeparated==true && separatorBuilder!=null ,"You must define separatorBuilder when you declare isSeparated=true") , super(key: key);

  /*
                        child: AnimationLimiter(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _list.length,
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                    AppDimens.space8, 0.0, AppDimens.space8, 0.0),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 750),
                    child: SlideAnimation(
                      horizontalOffset: 70.0,
                      curve: Curves.easeInOut,
                      child: FadeInAnimation(
                        child: TopBlogItems(
                          article: _list[index],
 */
  @override
  Widget build(BuildContext context) {
    final rtlScale = Directionality.of(context) == TextDirection.rtl ? -1 : 1;
    return isSeparated ? AnimationLimiter(
      child:  ListView.separated(
        separatorBuilder: separatorBuilder!,
        itemCount: items.length + itemPlus,
        scrollDirection: scrollDirection,
        padding: padding,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemBuilder: (context, index) {
          /// HERE IS THE SHIT ERROR -_-
          return iteBuilder(context,index,rtlScale);
        },
      ),
    ) : AnimationLimiter(
      child:  ListView.builder(
        itemCount: items.length + itemPlus,
        scrollDirection: scrollDirection,
        padding: padding,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemBuilder: (context, index) {
          /// HERE IS THE SHIT ERROR -_-
          return iteBuilder(context,index,rtlScale);
        },
      ),
    );
  }

  iteBuilder(BuildContext context,int index,int rtlScale) =>AnimationConfiguration.staggeredList(
    position: index,
    duration: duration,
    child: ScaleAnimation(
      curve: curve,
      scale: rtlScale * horizontalOffset,
      child: FadeInAnimation(
        child: itemBuilder(context, index),
      ),
    ),
  );
}
