import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class NotificationSwitch extends StatefulWidget {
  const NotificationSwitch({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<NotificationSwitch> createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch> {
  bool svitch = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Transform.scale(
          scale: 0.75,
          child: Switch(
            value: svitch,
            onChanged: (bool value) {
              setState(() {
                svitch = value;
              });
            },
            activeColor: Colors.white,
            activeTrackColor: AppColors.watermelonRed,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.watermelonRed,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
