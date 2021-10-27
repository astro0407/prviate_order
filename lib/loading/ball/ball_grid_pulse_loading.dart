import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/delay_tween.dart';
import 'ball.dart';
import 'ball_style.dart';

///
/// desc:小球脉冲效果
///

class BallGridPulseLoading extends StatefulWidget {
  final BallStyle ballStyle;
  final Duration duration;
  final Curve curve;

  const BallGridPulseLoading(
      {Key key,
      this.ballStyle,
      this.duration = const Duration(milliseconds: 1200),
      this.curve = Curves.linear})
      : super(key: key);

  @override
  _BallGridPulseLoadingState createState() => _BallGridPulseLoadingState();
}

class _BallGridPulseLoadingState extends State<BallGridPulseLoading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration)
        ..repeat();

    _animation =_controller.drive(CurveTween(curve: widget.curve));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: ScaleTransition(
            scale: DelayTween(begin: 0.0, end: 1.0, delay: index * .2)
                .animate(_animation),
            child: Ball(
              style: widget.ballStyle,
            ),
          ),
        );
      },
      itemCount: 9,
    );
  }
}
