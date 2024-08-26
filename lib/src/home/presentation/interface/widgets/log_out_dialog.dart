// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:fur/common_libs.dart';
// import 'package:fur/shared/assets/app_icons.dart';
// import 'package:fur/shared/exceptions/failure.dart';
// import 'package:fur/shared/extensions/text_button.dart';
// import 'package:fur/shared/widgets/app_snack_bar.dart';
// import 'package:fur/src/authentication/presentation/interface/screens/authentication_screen.dart';
// import 'package:fur/src/home/presentation/bloc/home_mixin.dart';
// import 'package:lottie/lottie.dart';

// class LogoutDialog extends StatelessWidget with HomeMixin {
//   LogoutDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context)!;

//     Future<void> handleSignOut() async {
//       try {
//         await signOut();
//         if (context.mounted) {
//           Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => AuthenticationScreen()),
//             (route) => true,
//           );
//         }
//       } on Failure catch (e) {
//         if (context.mounted) {
//           AppSnackBar.error(context, e.code);
//         }
//       }
//     }

//     return Dialog(
//       shape: ContinuousRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 LottieBuilder.asset(
//                   AppAnimatedIcons.alertTriangle,
//                   frameRate: FrameRate.max,
//                   repeat: false,
//                   height: 25,
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   localizations.appDialogTitlesSignOut,
//                   style: const TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 8.0, left: 10, bottom: 20),
//               child: Text(localizations.areYouSureYouWantToSignOut),
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   style: TextButton.styleFrom(
//                     fixedSize: const Size(double.infinity, 48),
//                     alignment: Alignment.centerLeft,
//                   ),
//                   child: Text(localizations.appButtonsCancel),
//                 ),
//                 const Spacer(),
//                 TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.red.shade50,
//                     overlayColor: Colors.red.shade200,
//                     fixedSize: const Size(double.infinity, 48),
//                     alignment: Alignment.centerLeft,
//                   ),
//                   child: Text(
//                     localizations.appButtonsSignOut,
//                     style: const TextStyle(color: Colors.red),
//                   ),
//                 ).withLoadingState(onPressed: handleSignOut),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
