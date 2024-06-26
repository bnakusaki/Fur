// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/core/species/presentation/interface/screens/select_species_screen.dart';
// import 'package:fur/shared/exceptions/failure.dart';
// import 'package:fur/shared/extensions/elevated_button.dart';
// import 'package:fur/shared/styles/text_styles.dart';
// import 'package:fur/shared/widgets/app_back_button.dart';
// import 'package:fur/shared/widgets/app_snack_bar.dart';
// import 'package:fur/src/profile/presentation/bloc/profile_mixin.dart';
// import 'package:image_picker/image_picker.dart';

// class AddPetPictureScreen extends HookWidget with ProfileMixin {
//   AddPetPictureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context)!;
//     final textStyles = Theme.of(context).extension<TextStyles>()!;

//     final profilePicture = useState<XFile?>(null);
//     final picker = ImagePicker();

//     Future<void> getImage() async {
//       try {
//         final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//         if (pickedFile != null) {
//           profilePicture.value = pickedFile;
//         }
//       } on Failure catch (e) {
//         if (context.mounted) {
//           AppSnackBar.error(context, e.code);
//         }
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading:Row(children: [ const AppBackButton(),]),
//         centerTitle: false,
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Selectspeciescreen(),
//                 ),
//               );
//             },
//             child: Text(localizations.appButtonsSkip),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Text(
//               'Add Benny\'s picture',
//               style: textStyles.h2,
//             ),
//             const Spacer(),
//             Center(
//               child: AspectRatio(
//                 aspectRatio: 1,
//                 child: Card(
//                   shape: ContinuousRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     side: BorderSide(color: Colors.grey.shade300, width: 4),
//                   ),
//                   child: profilePicture.value == null
//                       ? const SizedBox()
//                       : SizedBox(
//                           width: (MediaQuery.of(context).size.width - 40) * 2 / 3,
//                           height: (MediaQuery.of(context).size.width - 40) * 2 / 3,
//                           child: Image.file(
//                             File(profilePicture.value!.path),
//                             fit: BoxFit.cover,
//                           ).animate().fadeIn(),
//                         ),
//                 ).animate().scaleXY(begin: 0.90),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Center(
//               child: TextButton(
//                 onPressed: getImage,
//                 style: TextButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
//                 ),
//                 child: profilePicture.value == null
//                     ? Text(localizations.appButtonsAddPicture).animate().fadeIn()
//                     : Text(localizations.appButtonsChangePicture).animate().fadeIn(),
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//       ),
//       bottomNavigationBar: profilePicture.value != null
//           ? Padding(
//               padding: EdgeInsets.only(
//                 left: 20,
//                 right: 20,
//                 bottom: MediaQuery.of(context).padding.bottom + 20,
//               ),
//               child: ElevatedButton(
//                 onPressed: () {},
//                 child: Text(localizations.appButtonsNext),
//               ).withLoadingState(onPressed: () async {
//                 try {
//                   if (context.mounted) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Selectspeciescreen(),
//                       ),
//                     );
//                   }
//                 } on Failure catch (e) {
//                   if (context.mounted) {
//                     AppSnackBar.error(context, e.code);
//                   }
//                 }
//               }),
//             ).animate().fadeIn().slideY(begin: 0.1)
//           : null,
//     );
//   }
// }
