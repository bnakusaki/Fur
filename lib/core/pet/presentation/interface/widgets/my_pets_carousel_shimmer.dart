import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyPetsCarouselShimmer extends StatelessWidget {
  const MyPetsCarouselShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.9,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[50]!,
        child: const Card(margin: EdgeInsets.zero),
      ),
    );
  }
}
