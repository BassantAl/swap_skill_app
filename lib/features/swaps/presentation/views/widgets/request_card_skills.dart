import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_styles.dart';

class RequestCardSkills extends StatelessWidget {
  const RequestCardSkills({
    super.key,
    required this.skills, required this.title,
  });
  final List<String> skills;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: AppStyles.medium12(context)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      skills[index],
                      style: AppStyles.medium14(
                        context,
                      ).copyWith(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
