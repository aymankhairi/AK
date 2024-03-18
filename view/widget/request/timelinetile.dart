import 'package:alaraaf/core/constant/color.dart';
import 'package:alaraaf/view/widget/request/eventcard.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineRequest extends StatelessWidget {
  final bool isfirst;
  final bool islast;
  final bool ispast;
  final eventcard;
  const TimeLineRequest(
      {super.key,
      required this.isfirst,
      required this.islast,
      required this.ispast,
      required this.eventcard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: TimelineTile(
        indicatorStyle: IndicatorStyle(
            width: 20,
            color: ispast ? AppColor.secondrycolor : AppColor.primaryColor,
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: ispast ? Colors.white : AppColor.primaryColor)),
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.center,
        beforeLineStyle: LineStyle(
            color: ispast ? AppColor.primaryColor : AppColor.primaryColor),
        isFirst: isfirst,
        isLast: islast,
        endChild: EventCard(ispast: ispast, text: eventcard),
      ),
    );
  }
}
