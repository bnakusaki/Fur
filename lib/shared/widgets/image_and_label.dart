import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class ImageAndLabel extends HookWidget {
  const ImageAndLabel({
    super.key,
    required this.label,
    required this.imageUrl,
    this.onTap,
    this.fillCard = true,
    this.selected = false,
  });

  final String label;
  final String imageUrl;
  final void Function()? onTap;
  final bool fillCard;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: selected ? theme.primaryColor : Colors.grey.shade300,
                width: 4,
              ),
            ),
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
                fit: fillCard ? BoxFit.cover : BoxFit.contain,
                width: double.infinity,
                height: double.maxFinite,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: selected ? theme.primaryColor : null,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
