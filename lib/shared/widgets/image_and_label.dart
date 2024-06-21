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
  });

  final String label;
  final String imageUrl;
  final void Function()? onTap;
  final bool fillCard;

  @override
  Widget build(BuildContext context) {
    final color = useState<Color?>(null);

    // Future<Color> updatePalette(ImageProvider provider) async {
    //   final paletteGenerator = await PaletteGenerator.fromImageProvider(provider);
    //   return paletteGenerator.dominantColor?.color ?? Colors.blue;
    // }

    useMemoized(() async {
      // final imageProvider = CachedNetworkImageProvider(imageUrl);

      // color.value = await updatePalette(imageProvider);
    });

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Card(
            color: color.value ?? Colors.transparent,
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
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
