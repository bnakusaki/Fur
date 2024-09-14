// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:image_picker/image_picker.dart';

// class RemoveImageOrContinue extends StatelessWidget {
//   const RemoveImageOrContinue({
//     super.key,
//     required this.image,
//     required this.progressCounter,
//   });

//   final ValueNotifier<XFile?> image;
//   final ValueNotifier<int> progressCounter;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton.filled(
//           onPressed: () {
//             image.value = null;
//           },
//           icon: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SvgPicture.asset(
//               AppIcons.cross,
//               height: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         IconButton.filled(
//           onPressed: () {
//             progressCounter.value += 1;
//           },
//           icon: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 const Text(
//                   'Continue',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SvgPicture.asset(
//                   AppIcons.angleSmallRight,
//                   height: 20,
//                   color: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
