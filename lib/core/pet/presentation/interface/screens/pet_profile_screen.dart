import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/interface/screens/pet_profile_basic_info_screen.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class PetProfileScreen extends StatelessWidget {
  const PetProfileScreen({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: AppBackButton(),
            )
          ],
        ),
        title: Text(
          'Pet profile',
          style: textStyles.h2,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetProfileBasicInfoScreen(pet: pet),
                  ),
                );
              },
              title: const Text(
                'Basic information',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Name, species, breed, age, gender, weight',
                style: textStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: SvgPicture.asset(
                AppIcons.angleSmallRight,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditableTextProperty {
  final String label;
  final String value;
  final void Function(Pet) onEdit;

  _EditableTextProperty({
    required this.label,
    required this.value,
    required this.onEdit,
  });
}
