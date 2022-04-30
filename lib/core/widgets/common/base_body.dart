import 'package:flutter/material.dart';

class BaseBodyWidget extends StatefulWidget {
  final Widget portraitWidget;
  final Widget landscapeWidget;
  final bool isSafeAreaTop;

  const BaseBodyWidget(
      {Key? key,
      required this.landscapeWidget,
      required this.portraitWidget,
      this.isSafeAreaTop = true})
      : super(key: key);

  @override
  _BaseBodyWidgetState createState() => _BaseBodyWidgetState();
}

class _BaseBodyWidgetState extends State<BaseBodyWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: widget.isSafeAreaTop, child: _body(context));
  }

  Widget _body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return widget.portraitWidget;
    } else {
      return widget.landscapeWidget;
    }
  }
}
