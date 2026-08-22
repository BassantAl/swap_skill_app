import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            decoration: AppDecoration.decorationForTextInputFeild(
              context: context,
              hintText: 'Search for a skill or person',
              prefixIcon: Icon(Icons.search, size: 20),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
