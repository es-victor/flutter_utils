import 'package:flutter/material.dart';

const _loadingDuration = Duration(milliseconds: 1100);
const _curve = Curves.easeOut;

class LoadingDottedText extends StatefulWidget {
  const LoadingDottedText({
    Key? key,
    this.duration = _loadingDuration,
    this.text = "Loading",
    this.dot = ".",
    this.style = const TextStyle(fontSize: 24),
  }) : super(key: key);
  final Duration duration;
  final String text;
  final String dot;
  final TextStyle? style;

  @override
  State<LoadingDottedText> createState() => _LoadingDottedTextState();
}

class _LoadingDottedTextState extends State<LoadingDottedText>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationDot1;
  late Animation<double> _animationDot2;
  late Animation<double> _animationDot3;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _controller.repeat(reverse: true);
    _animationDot1 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 1, curve: _curve),
    );
    _animationDot2 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.40, 1, curve: _curve),
    );
    _animationDot3 = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.55, 1, curve: _curve),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          widget.text,
          style: widget.style,
        ),
        dotBuilder(_animationDot1),
        dotBuilder(_animationDot2),
        dotBuilder(_animationDot3),
      ],
    );
  }

  AnimatedBuilder dotBuilder(animation) {
    return AnimatedBuilder(
        key: UniqueKey(),
        animation: animation,
        builder: (context, _) {
          return Opacity(
              opacity: animation.value,
              child: Text(
                widget.dot,
                style: widget.style,
              ));
        });
  }
}
