// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/pet/domain/entities/pet.dart';
// import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
// import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/styles/app_sizes.dart';
// import 'package:fur/shared/styles/text_styles.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class PetProfileContactInformationScreen extends HookConsumerWidget with PetsMixin {
//   PetProfileContactInformationScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final textStyles = theme.extension<TextStyles>()!;

//     final pet = ref.watch(petNotifierProvider)!;

//     var infos = <_InfoData>[
//       _InfoData(
//         title: 'Owner\'s name',
//         onEdit: (pet) {},
//         value: '',
//       ),
//       _InfoData(
//         title: 'Owner\'s contact information',
//         icon: AppIcons.houseUser,
//         onEdit: (pet) {},
//         value: '',
//       ),
//       _InfoData(
//         title: 'Veterinarians\'s contact information',
//         icon: AppIcons.userMd,
//         onEdit: (pet) {},
//         value: '',
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Contact information',
//         ),
//       ),
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
//         child: ListView(
//           children: [
//             const SizedBox(height: 20),
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final info = infos[index];

//                 return ListTile(
//                   // onTap: () => info.onEdit(pet),
//                   leading: info.icon != null ? SvgPicture.asset(info.icon!) : null,
//                   title: Text(
//                     info.title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   subtitle: info.value != null
//                       ? Text(
//                           info.value!,
//                           style: textStyles.caption,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         )
//                       : null,
//                   tileColor: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   trailing: SvgPicture.asset(
//                     info.value != null ? AppIcons.edit : AppIcons.angleSmallRight,
//                     height: 20,
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const SizedBox(height: 10);
//               },
//               itemCount: infos.length,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _InfoData {
//   final String title;
//   final String? value;
//   final Function(ValueNotifier<Pet> param) onEdit;
//   final String? icon;

//   _InfoData({
//     required this.title,
//     required this.value,
//     required this.onEdit,
//     this.icon,
//   });
// }
