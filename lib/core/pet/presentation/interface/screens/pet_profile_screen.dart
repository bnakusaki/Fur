// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/pet/presentation/interface/screens/profile_info/pet_profile_appearance_screen.dart';
// import 'package:fur/core/pet/presentation/interface/screens/profile_info/pet_profile_basic_info_screen.dart';
// import 'package:fur/core/pet/presentation/interface/screens/profile_info/pet_profile_behavorial_information_screen.dart';
// import 'package:fur/core/pet/presentation/interface/screens/profile_info/pet_profile_contact_information_screen.dart';
// import 'package:fur/core/pet/presentation/interface/screens/profile_info/pet_profile_health_and_care_screen.dart';
// import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/styles/app_sizes.dart';
// import 'package:fur/shared/styles/text_styles.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';

// class PetProfileScreen extends ConsumerWidget {
//   const PetProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final textStyles = theme.extension<TextStyles>()!;

//     final pet = ref.watch(petNotifierProvider)!;

//     final profileSections = <_ProfileSection>[
//       _ProfileSection(
//         title: localizations.appPageTitlesBasicInformation,
//         icon: AppIcons.info,
//         properties: [
//           localizations.name,
//           localizations.species,
//           localizations.breed,
//           localizations.sex,
//           localizations.age,
//           localizations.weightInKilograms,
//         ],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PetProfileBasicInfoScreen(),
//             ),
//           );
//         },
//       ),
//       _ProfileSection(
//         title: localizations.appPageTitlesAppearance,
//         icon: AppIcons.makeupBrush,
//         properties: [
//           localizations.color,
//           localizations.markings,
//           localizations.size,
//         ],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PetProfileAppearanceScreen(),
//             ),
//           );
//         },
//       ),
//       _ProfileSection(
//         title: localizations.appPageTitlesHealthAndCare,
//         icon: AppIcons.heartRate,
//         properties: [
//           localizations.vaccinationStatus,
//           localizations.medicalHistory,
//           localizations.allergies,
//           localizations.dieteryPreferences,
//           localizations.medications,
//         ],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PetProfileHealthAndCareScreen(),
//             ),
//           );
//         },
//       ),
//       _ProfileSection(
//         title: localizations.appPageTitlesBehavorialInformation,
//         icon: AppIcons.brain,
//         properties: [
//           localizations.temprament,
//           localizations.trainingLevel,
//           localizations.favoriteActivities,
//           localizations.compatibilityWithOtherPets,
//           localizations.behavorialIssues,
//         ],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PetProfileBehavorialInformationScreen(),
//             ),
//           );
//         },
//       ),
//       _ProfileSection(
//         title: localizations.appPageTitlesContactInformation,
//         icon: AppIcons.phoneGuide,
//         properties: [
//           localizations.ownersName,
//           localizations.ownersContactInformation,
//           localizations.veterinariansContactInformation,
//         ],
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PetProfileContactInformationScreen(),
//             ),
//           );
//         },
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(localizations.appPageTitlesPetProfile(pet.name)),
//       ),
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               ListView.separated(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 padding: const EdgeInsets.only(top: 20),
//                 itemBuilder: (context, index) {
//                   final profileSection = profileSections[index];

//                   return ListTile(
//                     onTap: profileSection.onTap,
//                     leading: SvgPicture.asset(
//                       profileSection.icon,
//                     ),
//                     title: Text(
//                       profileSection.title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     subtitle: Text(
//                       profileSection.properties.join(', ').toString(),
//                       style: textStyles.caption,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     tileColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     trailing: SvgPicture.asset(
//                       AppIcons.angleSmallRight,
//                       height: 20,
//                     ),
//                   );
//                 },
//                 separatorBuilder: (context, index) => const SizedBox(height: 10),
//                 itemCount: profileSections.length,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Text(
//             'Last updated on ${DateFormat('MMMM dd, yyyy').format(DateTime.now())}',
//             style: TextStyle(
//               fontSize: 12,
//               color: Colors.grey.shade600,
//               fontWeight: FontWeight.w500,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _ProfileSection {
//   final String title;
//   final List<String> properties;
//   final void Function() onTap;
//   final String icon;

//   _ProfileSection({
//     required this.title,
//     required this.properties,
//     required this.onTap,
//     required this.icon,
//   });
// }
