// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/pet_screen_app_bar.dart';
// import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
// import 'package:fur/core/pet/presentation/providers/retrieve_breed.dart';
// import 'package:fur/shared/styles/text_styles.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class PetScreen extends HookConsumerWidget with PetsMixin {
//   PetScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final textStyles = theme.extension<TextStyles>()!;

//     final pet = ref.watch(petNotifierProvider)!;

//     final breed = ref.watch(retrieveBreedProvider(
//       Localizations.localeOf(context).languageCode,
//       pet.breed,
//       pet.species,
//     ));

//     // final services = <_PetService>[
//     //   _PetService(
//     //     title: 'Grooming',
//     //     image: AppImages.beautySaloon,
//     //     onTap: () {},
//     //   ),
//     //   _PetService(
//     //     title: 'Training',
//     //     image: AppImages.dogTraining,
//     //     onTap: () {},
//     //   ),
//     //   _PetService(
//     //     title: 'Pet sitting',
//     //     image: AppImages.dogAlt,
//     //     onTap: () {},
//     //   ),
//     // ];

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           PetScreenAppBar(pet: pet),
//           // SliverList(
//           //   delegate: SliverChildListDelegate(
//           //     [
//           //       Padding(
//           //         padding: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
//           //         child: Column(
//           //           mainAxisSize: MainAxisSize.min,
//           //           children: [
//           //             const SizedBox(height: 20),
//           //             ListTile(
//           //               onTap: () {},
//           //               title: const Text(
//           //                 'Vaccination schedule',
//           //                 style: TextStyle(fontWeight: FontWeight.w600),
//           //               ),
//           //               subtitle: Text.rich(
//           //                 TextSpan(
//           //                   children: [
//           //                     const TextSpan(
//           //                       text: 'Next: ',
//           //                       style: TextStyle(
//           //                         fontWeight: FontWeight.w600,
//           //                       ),
//           //                     ),
//           //                     TextSpan(
//           //                       text: 'Rabies (${DateFormat('MMM d').format(DateTime.now())})',
//           //                       style: const TextStyle(
//           //                         fontWeight: FontWeight.w500,
//           //                       ),
//           //                     ),
//           //                   ],
//           //                 ),
//           //               ),
//           //               trailing: SvgPicture.asset(AppIcons.calendarClock),
//           //             ),
//           //             const SizedBox(height: 20),
//           //             const Align(
//           //               alignment: Alignment.centerLeft,
//           //               child: Text(
//           //                 'Services',
//           //                 style: TextStyle(
//           //                   fontWeight: FontWeight.w600,
//           //                   fontSize: 16,
//           //                 ),
//           //               ),
//           //             ),
//           //             const SizedBox(height: 10),
//           //             GridView.count(
//           //               padding: EdgeInsets.zero,
//           //               shrinkWrap: true,
//           //               physics: const NeverScrollableScrollPhysics(),
//           //               crossAxisCount: 2,
//           //               childAspectRatio: 0.85,
//           //               children: services.map((e) {
//           //                 return Column(
//           //                   mainAxisSize: MainAxisSize.min,
//           //                   children: [
//           //                     Card(
//           //                       color: Colors.white,
//           //                       shape: RoundedRectangleBorder(
//           //                         borderRadius: BorderRadius.circular(10),
//           //                       ),
//           //                       child: InkWell(
//           //                         onTap: e.onTap,
//           //                         child: SizedBox(
//           //                           child: Padding(
//           //                             padding: const EdgeInsets.all(30),
//           //                             child: Image.asset(
//           //                               e.image,
//           //                             ),
//           //                           ),
//           //                         ),
//           //                       ),
//           //                     ),
//           //                     Text(
//           //                       e.title,
//           //                       style: const TextStyle(fontWeight: FontWeight.w600),
//           //                     ),
//           //                   ],
//           //                 );
//           //               }).toList(),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }

// class _InfoCard extends StatelessWidget {
//   const _InfoCard({
//     required this.color,
//     required this.title,
//     required this.value,
//     required this.icon,
//   });

//   final MaterialColor color;
//   final String title;
//   final String value;
//   final String icon;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shadowColor: Colors.grey.shade50,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             AspectRatio(
//               aspectRatio: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: color.shade100,
//                 ),
//                 alignment: Alignment.center,
//                 child: SvgPicture.asset(
//                   icon,
//                   height: 20,
//                   width: 20,
//                   color: color,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   Text(
//                     value,
//                     style: const TextStyle(fontWeight: FontWeight.w500),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _PetService {
//   final String title;
//   final String image;
//   final void Function() onTap;

//   _PetService({
//     required this.title,
//     required this.image,
//     required this.onTap,
//   });
// }
