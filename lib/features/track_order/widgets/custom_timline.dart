import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimelinetile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget? child;
  const CustomTimelinetile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: isPast ? Colors.white70 : Color(0xFFffb3b3)),
            color: isPast ? Color(0xFFff4d4d) : Color(0xFFffb3b3),
            height: 25.0,
            width: 25.0),
        beforeLineStyle:
            LineStyle(color: isPast ? Color(0xFFff4d4d) : Color(0xFFffb3b3)),
        endChild: child,
      ),
    );
  }
}
