import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fur/firebase_options.dart';
import 'package:fur/injection_container.dart';
import 'package:fur/shared/styles/app_theme.dart';
import 'package:fur/wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  init();

  Gemini.init(apiKey: 'AIzaSyCzL0UWhBTVzvoqiMWjlqlRYpS42WanzFo');

  runApp(
    const ProviderScope(
      child: FurApp(),
    ),
  );
}

class FurApp extends StatelessWidget {
  const FurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme().theme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Wrapper(),
      // home: const PetAnalysisScreen(),
    );
  }
}

// class PetAnalysisScreen extends StatefulWidget {
//   const PetAnalysisScreen({super.key});

//   @override
//   _PetAnalysisScreenState createState() => _PetAnalysisScreenState();
// }

// class _PetAnalysisScreenState extends State<PetAnalysisScreen> {
//   XFile? _image;
//   String _analysisResult = '';

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         _image = image;
//       });

//       _analyzeImage(image);
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pet Analysis'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null ? const Text('No image selected.') : Image.file(File(_image!.path)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Pick an image'),
//             ),
//             const SizedBox(height: 20),
//             Text(_analysisResult),
//           ],
//         ),
//       ),
//     );
//   }
// }
