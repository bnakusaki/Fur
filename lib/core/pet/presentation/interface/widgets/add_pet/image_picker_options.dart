import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/extensions/icon_button.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    super.key,
    required this.image,
  });

  final ValueNotifier<XFile?> image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton.filled(
          onPressed: null,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AppIcons.camera,
              height: 20,
              color: Colors.white,
            ),
          ),
        ).withLoadingState(
          onPressed: () async {
            final selectedImage = await ImagePicker().pickImage(source: ImageSource.camera);

            if (selectedImage != null) {
              image.value = selectedImage;
            }
          },
        ),
        IconButton.filled(
          onPressed: null,
          icon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              AppIcons.gallery,
              height: 20,
              color: Colors.white,
            ),
          ),
        ).withLoadingState(
          onPressed: () async {
            final selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

            if (selectedImage != null) {
              image.value = selectedImage;
            }
          },
        ),
      ],
    );
  }
}
