// // ignore_for_file: deprecated_member_use

// import 'dart:ui';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/animals/presentation/interface/screens/select_animal_screen.dart';
// import 'package:fur/core/pet/presentation/interface/screens/view_pet_image_scree.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/widgets/app_snack_bar.dart';
// import 'package:image_picker/image_picker.dart';

// class InputPetPictureScreen extends HookWidget {
//   const InputPetPictureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context)!;

//     final cameras = useState<List<CameraDescription>>([]);
//     final cameraController = useState<CameraController?>(null);

//     final picker = ImagePicker();

//     Future<void> getImage() async {
//       try {
//         final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//         if (pickedFile != null) {
//           if (context.mounted) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ViewPetImageScreen(image: pickedFile),
//               ),
//             );
//           }
//         }
//       } catch (e) {
//         if (context.mounted) {
//           AppSnackBar.error(context, e.toString());
//         }
//       }
//     }

//     useMemoized(() async {
//       cameras.value = await availableCameras();
//       if (cameras.value.isNotEmpty) {
//         cameraController.value = CameraController(
//           cameras.value.first,
//           ResolutionPreset.ultraHigh,
//         );

//         cameraController.value!.initialize().catchError((error) {
//           debugPrint(error);
//         });
//       }
//     });

//     void handleOnSkip() {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SelectAnimalScreen(),
//         ),
//       );
//     }

//     Future<void> handleOnShutter() async {
//       if (cameraController.value != null) {
//         final picture = await cameraController.value!.takePicture();
//         if (context.mounted) {
//           Navigator.of(context).pop(picture);
//         }
//       }
//     }

//     Future<void> handleFlash() async {
//       if (cameraController.value != null) {
//         final flashMode = cameraController.value!.value.flashMode;
//         if (flashMode == FlashMode.off) {
//           await cameraController.value!.setFlashMode(FlashMode.always);
//         } else {
//           await cameraController.value!.setFlashMode(FlashMode.off);
//         }
//       }
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           if (cameraController.value != null) Center(child: CameraPreview(cameraController.value!)),
//           SafeArea(
//             minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(3),
//                   height: 55,
//                   width: 55,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                   child: Stack(
//                     children: [
//                       BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
//                       ),
//                       IconButton(
//                         onPressed: handleFlash,
//                         icon: SvgPicture.asset(
//                           AppIcons.bolt,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: handleOnSkip,
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     padding: const EdgeInsets.all(3),
//                     height: 45,
//                     width: 75,
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Stack(
//                       children: [
//                         BackdropFilter(
//                           filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
//                         ),
//                         Center(
//                           child: Text(
//                             localizations.appButtonsSkip,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: SafeArea(
//               minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _PickFromGalleryButton(
//                     localizations: localizations,
//                     getImage: getImage,
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.maxFinite,
//                     height: 100,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 2, color: Colors.white.withOpacity(0.1)),
//                         color: Colors.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(100),
//                       ),
//                       child: Stack(
//                         children: [
//                           // z -
//                           BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10)),
//                           Center(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const CircleAvatar(
//                                     radius: 30,
//                                   ),
//                                   // Shutter button
//                                   GestureDetector(
//                                     onTap: handleOnShutter,
//                                     child: Container(
//                                       padding: const EdgeInsets.all(3),
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(width: 4, color: Colors.white),
//                                       ),
//                                       child: Container(
//                                         height: 60,
//                                         width: 60,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // Camera rotate
//                                   Container(
//                                     padding: const EdgeInsets.all(3),
//                                     height: 55,
//                                     width: 55,
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white.withOpacity(0.1),
//                                       // color: Colors.white,
//                                     ),
//                                     child: Stack(
//                                       children: [
//                                         BackdropFilter(
//                                           filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
//                                         ),
//                                         IconButton(
//                                           onPressed: () {},
//                                           icon: SvgPicture.asset(
//                                             AppIcons.cameraRotate,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // child: ElevatedButton(
//           )
//         ],
//       ).animate().fadeIn(),
//     );
//   }
// }

// class _PickFromGalleryButton extends StatelessWidget {
//   const _PickFromGalleryButton({
//     required this.localizations,
//     required this.getImage,
//   });

//   final AppLocalizations localizations;
//   final Future<void> Function() getImage;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       height: 30,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(100),
//         onTap: getImage,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(width: 2, color: Colors.white.withOpacity(0.1)),
//             color: Colors.white.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: Stack(
//             children: [
//               // z -
//               BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10)),
//               Center(
//                 child: Text(
//                   localizations.appButtonsPickFromGallery,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
