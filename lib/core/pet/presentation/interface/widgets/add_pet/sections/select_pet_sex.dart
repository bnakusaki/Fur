// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/core/pet/domain/entities/pet.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/styles/app_sizes.dart';
// import 'package:image_picker/image_picker.dart';

// class SelectPetSex extends StatelessWidget {
//   const SelectPetSex({
//     super.key,
//     required this.image,
//     required this.petNameController,
//     required this.theme,
//     required this.selectedSex,
//   });

//   final ValueNotifier<XFile?> image;
//   final TextEditingController petNameController;
//   final ThemeData theme;
//   final ValueNotifier<PetGender?> selectedSex;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: FileImage(
//                   File(image.value!.path),
//                 ),
//                 radius: 100,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'What\'s ${petNameController.text}\'s sex?',
//               style: theme.textTheme.titleMedium,
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 1,
//                         child: Card(
//                           color: selectedSex.value == PetGender.male ? Colors.blue : Colors.white,
//                           shape: ContinuousRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               selectedSex.value = PetGender.male;
//                             },
//                             child: Center(
//                               child: SvgPicture.asset(
//                                 AppIcons.male,
//                                 height: 50,
//                                 color: selectedSex.value == PetGender.male
//                                     ? Colors.white
//                                     : Colors.blue,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Male',
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       )
//                     ],
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(
//                     right: 20.0,
//                     left: 20.0,
//                     bottom: 30.0,
//                   ),
//                   child: Text(
//                     'or',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       AspectRatio(
//                         aspectRatio: 1,
//                         child: Card(
//                           color: selectedSex.value == PetGender.female
//                               ? Colors.pink.shade400
//                               : Colors.white,
//                           shape: ContinuousRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: InkWell(
//                             onTap: () {
//                               selectedSex.value = PetGender.female;
//                             },
//                             child: Center(
//                               child: SvgPicture.asset(
//                                 AppIcons.female,
//                                 height: 50,
//                                 color: selectedSex.value == PetGender.female
//                                     ? Colors.white
//                                     : Colors.pink,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       const Text(
//                         'Female',
//                         style: TextStyle(fontWeight: FontWeight.w600),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ));
//   }
// }
