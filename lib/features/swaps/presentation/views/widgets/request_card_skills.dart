import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class RequestCardSkills extends StatelessWidget {
  const RequestCardSkills({super.key, required this.faIcon});
  final FaIcon faIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              faIcon,
              SizedBox(width: 5),
              Text('WANTS TO LEARN', style: AppStyles.medium12(context)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              'Flutter',
              style: AppStyles.medium14(context).copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
