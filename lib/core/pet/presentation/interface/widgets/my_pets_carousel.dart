// import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/my_pets_carousel_empty_state.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/my_pets_carousel_error_state.dart';
// import 'package:fur/core/pet/presentation/interface/widgets/my_pets_carousel_shimmer.dart';
// import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
// import 'package:fur/core/pet/presentation/providers/list_pets.dart';
// import 'package:fur/core/pet/presentation/providers/pet_notifier.dart';
// import 'package:fur/shared/exceptions/failure.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class MyPetsCarousel extends ConsumerWidget {
//   const MyPetsCarousel({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final pets = ref.watch(listPetsProvider(FirebaseAuth.instance.currentUser?.uid ?? ''));

//     return switch (pets) {
//       AsyncData(:final value) =>
//         value.isEmpty ? const MyPetsCarouselEmptyState() : const _PetsCarousel(),
//       AsyncError(:final error as Failure) => MyPetsCarouselErrorState(error: error),
//       _ => const MyPetsCarouselShimmer(),
//     };
//   }
// }

// class _PetsCarousel extends HookConsumerWidget {
//   const _PetsCarousel();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final localizations = AppLocalizations.of(context)!;
//     final theme = Theme.of(context);

//     final controller = usePageController();
//     final page = useState(0);

//     final pets = ref.watch(cachedPetsProvider);

//     return AspectRatio(
//       aspectRatio: 0.9,
//       child: Stack(
//         children: [
//           Container(
//             clipBehavior: Clip.hardEdge,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: PageView(
//               controller: controller,
//               onPageChanged: (index) {
//                 page.value = index;
//               },
//               children: List.generate(pets.length, (index) {
//                 final pet = pets[index];
//                 return _Image(
//                   image: pet.images.first,
//                   index: index,
//                   currentIndex: page.value,
//                 );
//               }),
//             ),
//           ),
//           IgnorePointer(
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black.withOpacity(0.1),
//                     Colors.black.withOpacity(0.5),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             right: 10,
//             child: TextButton(
//               onPressed: () {
//                 ref.watch(petNotifierProvider.notifier).set(pets[page.value]);
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) {
//                 //     // return PetScreen();
//                 //   }),
//                 // );
//               },
//               style: TextButton.styleFrom(
//                 backgroundColor: theme.primaryColor.withOpacity(0.5),
//               ),
//               child: Text(
//                 localizations.appButtonsViewPet,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 10,
//             left: 10,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   pets[page.value].name,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SmoothPageIndicator(
//                   controller: controller,
//                   count: pets.length,
//                   effect: ExpandingDotsEffect(
//                     dotWidth: 8,
//                     dotHeight: 8,
//                     activeDotColor: theme.primaryColor,
//                     dotColor: theme.highlightColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Image extends HookWidget {
//   const _Image({
//     required this.image,
//     required this.index,
//     required this.currentIndex,
//   });

//   final String image;
//   final int index;
//   final int currentIndex;

//   @override
//   Widget build(BuildContext context) {
//     final animation = useAnimationController(
//       duration: const Duration(seconds: 10),
//       lowerBound: 1,
//       upperBound: 1.2,
//     );

//     useEffect(
//       () {
//         if (index == currentIndex) {
//           animation.forward();
//         } else {
//           animation.reverse();
//         }
//         return null;
//       },
//       [currentIndex],
//     );

//     return ScaleTransition(
//       scale: animation,
//       child: CachedNetworkImage(
//         imageUrl: image,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
