import 'package:flutter/material.dart';
import 'package:fur/core/animals/presentation/interface/screens/select_animal_screen.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class ViewPetImageScreen extends StatelessWidget {
  const ViewPetImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> handleSave() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectAnimalScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBackButton(),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: handleSave,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
