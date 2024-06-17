import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class ImageAndLabel extends StatelessWidget {
  const ImageAndLabel({
    super.key,
    required this.label,
    required this.imageUrl,
    this.onTap,
  });

  final String label;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Card(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                errorWidget: (context, url, error) {
                  return Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppIcons.imageSlash,
                      height: 30,
                      width: 30,
                    ),
                  );
                },
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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
