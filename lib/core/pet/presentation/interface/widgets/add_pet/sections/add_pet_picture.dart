// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/add_pet/image_picker_options.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/add_pet/remove_image_or_continue.dart';
// import 'package:fur/shared/styles/app_sizes.dart';
// import 'package:image_picker/image_picker.dart';

// class AddPetPicture extends StatelessWidget {
//   const AddPetPicture({
//     super.key,
//     required this.image,
//     required this.progressCounter,
//   });

//   final ValueNotifier<XFile?> image;
//   final ValueNotifier<int> progressCounter;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Center(
//           child: image.value != null
//               ? Image.file(
//                   File(image.value!.path),
//                   height: MediaQuery.sizeOf(context).height,
//                   width: MediaQuery.sizeOf(context).width,
//                   fit: BoxFit.cover,
//                 )
//               : const Text('Add your pet\'s picture'),
//         ),
//         SafeArea(
//           minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: image.value == null
//                   ? ImagePickerOptions(image: image)
//                   : RemoveImageOrContinue(image: image, progressCounter: progressCounter),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
