import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/app_sizes.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/shared/widgets/app_text_form_field.dart';

class PetProfileBasicInfoScreen extends HookWidget {
  const PetProfileBasicInfoScreen({super.key, required this.pet});

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final name = useState(pet.name);

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
          'Basic information',
          style: textStyles.h2,
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: AppSizes.screenHorizontalPadding),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Text(
              'Name',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            AppTextFormField(
              initialValue: name.value,
              onChanged: (value) => name.value = value!,
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PetProfileBasicInfoScreen(pet: pet),
                //   ),
                // );
              },
              title: const Text(
                'Species',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Dog',
                style: textStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: SvgPicture.asset(
                AppIcons.edit,
                height: 20,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PetProfileBasicInfoScreen(pet: pet),
                //   ),
                // );
              },
              title: const Text(
                'Breed',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Dog',
                style: textStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: SvgPicture.asset(
                AppIcons.edit,
                height: 20,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Age',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Text(
                '2 years',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Gender',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Text(
                'Male',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PetProfileBasicInfoScreen(pet: pet),
                //   ),
                // );
              },
              title: const Text(
                'Weight',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '28 kg',
                style: textStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              trailing: SvgPicture.asset(
                AppIcons.edit,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
