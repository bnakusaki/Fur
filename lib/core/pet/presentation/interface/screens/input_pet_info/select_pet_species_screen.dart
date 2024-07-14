// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/pet/domain/entities/species.dart';
// import 'package:fur/core/pet/presentation/bloc/pets_mixin.dart';
// import 'package:fur/core/pet/presentation/providers/list_species.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/styles/text_styles.dart';
// import 'package:fur/shared/widgets/app_back_button.dart';
// import 'package:fur/shared/widgets/app_text_form_field.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:lottie/lottie.dart';

// class SelectPetspeciesScreen extends HookConsumerWidget with PetsMixin {
//   SelectPetspeciesScreen({super.key, required this.onSelect});

//   final void Function(Species species) onSelect;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);
//     final textStyles = theme.extension<TextStyles>()!;

//     final magnifierCancelAnimationController =
//         useAnimationController(duration: const Duration(milliseconds: 500));
//     final searchFieldController = useTextEditingController();
//     final searchFieldFocusNode = useFocusNode();

//     final searchTerm = useState('');
//     final selectedSpecies = useState<Species?>(null);

//     final species = ref.watch(listSpeciesProvider(Localizations.localeOf(context).languageCode));

//     final randInt = useState(Random().nextInt(sadPets.length));

//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: const Row(children: [
//             Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: AppBackButton(),
//             ),
//           ]),
//           title: Text(
//             localizations.appPageTitlesBasicInformation,
//           ),
//         ),
//         body: SafeArea(
//           minimum: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Text(
//                 localizations.selectPetSpecies,
//                 style: theme.textTheme.titleMedium,
//               ),
//               const SizedBox(height: 10),
//               AppTextFormField(
//                 controller: searchFieldController,
//                 focusNode: searchFieldFocusNode,
//                 hintText: localizations.appTextFieldHintsSearch,
//                 onChanged: (value) {
//                   if (value!.trim().isEmpty) {
//                     magnifierCancelAnimationController.reverse();
//                   } else {
//                     magnifierCancelAnimationController.forward();
//                   }
//                   searchTerm.value = value;
//                 },
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     if (searchTerm.value.isNotEmpty) {
//                       magnifierCancelAnimationController.reverse();
//                       searchTerm.value = '';
//                       searchFieldController.clear();
//                     } else {
//                       searchFieldFocusNode.requestFocus();
//                     }
//                   },
//                   icon: LottieBuilder.asset(
//                     frameRate: FrameRate.max,
//                     controller: magnifierCancelAnimationController,
//                     AppAnimatedIcons.searchToX,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: switch (species) {
//                   AsyncData(:final value) => Builder(
//                       builder: (context) {
//                         late List<Species> filteredspecies;
//                         if (searchTerm.value.isEmpty) {
//                           filteredspecies = value;
//                         } else {
//                           filteredspecies = value.where((species) {
//                             return species.name
//                                 .toLowerCase()
//                                 .contains(searchTerm.value.toLowerCase());
//                           }).toList();
//                         }

//                         return filteredspecies.isEmpty
//                             ? Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SizedBox(
//                                       width: MediaQuery.of(context).size.width * 0.6,
//                                       height: MediaQuery.of(context).size.width * 0.6,
//                                       child: Card(
//                                         shape: CircleBorder(
//                                           side: BorderSide(
//                                             color: Colors.grey.shade300,
//                                             width: 4,
//                                           ),
//                                         ),
//                                         child: Image.asset(
//                                           sadPets[randInt.value],
//                                           fit: BoxFit.cover,
//                                         ).animate().fadeIn(),
//                                       ),
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Text(
//                                       localizations.noPetsFound,
//                                       style: textStyles.emptyState,
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     const SizedBox(height: 120),
//                                   ],
//                                 ),
//                               )
//                             : Scrollbar(
//                                 child: ListView.separated(
//                                   itemBuilder: (context, index) {
//                                     final species0 = value[index];
//                                     final selected = selectedSpecies.value == species0;

//                                     return ListTile(
//                                       tileColor: Colors.white,
//                                       title: Text(
//                                         species0.name,
//                                         style: TextStyle(
//                                             fontWeight: selected ? FontWeight.w600 : null),
//                                       ),
//                                       selected: selected,
//                                       shape: ContinuousRectangleBorder(
//                                           borderRadius: BorderRadius.circular(10)),
//                                       onTap: () {
//                                         selectedSpecies.value = species0;
//                                       },
//                                       selectedTileColor: theme.primaryColor.withOpacity(0.2),
//                                     );
//                                   },
//                                   separatorBuilder: (context, index) {
//                                     return const SizedBox(height: 10);
//                                   },
//                                   itemCount: filteredspecies.length,
//                                 ),
//                               );
//                       },
//                     ),
//                   AsyncError(:final error) => Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.6,
//                             height: MediaQuery.of(context).size.width * 0.6,
//                             child: Card(
//                               shape: CircleBorder(
//                                 side: BorderSide(
//                                   color: Colors.grey.shade300,
//                                   width: 4,
//                                 ),
//                               ),
//                               child: Image.asset(
//                                 sadPets[randInt.value],
//                                 fit: BoxFit.cover,
//                               ).animate().fadeIn(),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text(
//                             error.toString(),
//                             style: textStyles.emptyState,
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 120),
//                         ],
//                       ),
//                     ),
//                   _ => const Center(
//                       child: SizedBox(
//                         height: 30,
//                         child: LoadingIndicator(
//                           indicatorType: Indicator.ballGridPulse,
//                         ),
//                       ),
//                     ),
//                 },
//               )
//             ],
//           ),
//         ),
//         bottomNavigationBar: selectedSpecies.value != null
//             ? Padding(
//                 padding: EdgeInsets.only(
//                   bottom: MediaQuery.paddingOf(context).bottom + 20,
//                   left: 20,
//                   right: 20,
//                 ),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     onSelect(selectedSpecies.value!);
//                   },
//                   child: Text(localizations.appButtonsContinue),
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
