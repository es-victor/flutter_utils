import 'package:flutter/material.dart';

import '../constants.dart';

class CompletionWidget extends StatefulWidget {
  final int completionLevel;
  final int fullCompletion;
  final double? height;
  final bool? invert;
  const CompletionWidget({
    Key? key,
    required this.completionLevel,
    required this.fullCompletion,
    this.height = 12,
    this.invert = false,
  }) : super(key: key);

  @override
  State<CompletionWidget> createState() => _CompletionWidgetState();
}

class _CompletionWidgetState extends State<CompletionWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.height!),
        child: Row(
          children: [
            Flexible(
              flex: widget.completionLevel,
              child: Container(
                color: widget.invert!
                    ? Colors.white60
                    : Theme.of(context).primaryColor,
              ),
            ),
            Flexible(
              flex: widget.fullCompletion - widget.completionLevel,
              child: Container(
                color: widget.invert!
                    ? Colors.white24
                    : Theme.of(context).primaryColor.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletionDragWidget extends StatelessWidget {
  final double completionLevel;
  final double fullCompletion;
  final double? height;
  final double? radius;
  final bool? invert;
  const CompletionDragWidget({
    Key? key,
    required this.completionLevel,
    required this.fullCompletion,
    this.height = p4,
    this.radius = p4,
    this.invert = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Flexible(
            flex: completionLevel.round(),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(height!),
                      bottomLeft: Radius.circular(height!),
                    ),
                    color: invert!
                        ? Colors.white60
                        : Theme.of(context).primaryColor.withOpacity(0.4),
                  ),
                ),
                Positioned(
                  right: -p2 / 2,
                  child: Container(
                    width: p2,
                    height: height! + p3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(p2),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: (fullCompletion - completionLevel).round(),
            child: Container(
              decoration: BoxDecoration(
                color: invert!
                    ? Colors.white24
                    : Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(height!),
                  topRight: Radius.circular(height!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
