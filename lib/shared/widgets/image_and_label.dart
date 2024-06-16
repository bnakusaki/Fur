import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAndLabel extends StatelessWidget {
  const ImageAndLabel({
    super.key,
    required this.image,
    required this.label,
    this.imageUrl,
    this.onTap,
  });

  final String image;
  final String label;
  final String? imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: CachedNetworkImage(
                imageUrl: imageUrl ?? image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.maxFinite,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
