import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoriesListView extends StatelessWidget {
  const ShimmerCategoriesListView({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 48,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
            
            ),
          ),
        );
      },
    );
  }
}
