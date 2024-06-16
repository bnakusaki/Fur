import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';
import 'package:fur/src/pets/domain/entities/pet.dart';

class InputPetAgeScreen extends HookWidget {
  const InputPetAgeScreen({
    super.key,
    required this.pet,
  });

  final Pet pet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyles = theme.extension<TextStyles>()!;

    final years = useState(0);
    final months = useState(0);

    useEffect(() {
      if (months.value > 12) {
        months.value = months.value - 12;
        years.value = years.value + 1;
      }
      return null;
    }, [months.value]);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AppBackButton(),
        centerTitle: false,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'What is the age of your dog?',
                style: textStyles.h2,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filledTonal(
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              years.value = years.value + 1;
                            },
                            icon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AppIcons.plus,
                                height: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${years.value}',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(
                            'Years',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 40),
                          IconButton.filledTonal(
                            onPressed: () async {
                              if (years.value > 0) {
                                years.value = years.value - 1;
                                HapticFeedback.heavyImpact();
                              } else {
                                HapticFeedback.lightImpact();
                                await Future.delayed(100.milliseconds);
                                HapticFeedback.lightImpact();
                              }
                            },
                            icon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AppIcons.minus,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton.filledTonal(
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              months.value = months.value + 1;
                            },
                            icon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AppIcons.plus,
                                height: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${months.value}',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryColor,
                            ),
                          ),
                          Text(
                            'Months',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: theme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 40),
                          IconButton.filledTonal(
                            onPressed: () async {
                              if (months.value > 0) {
                                months.value = months.value - 1;
                                HapticFeedback.heavyImpact();
                              } else {
                                HapticFeedback.lightImpact();
                                await Future.delayed(100.milliseconds);
                                HapticFeedback.lightImpact();
                              }
                            },
                            icon: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SvgPicture.asset(
                                AppIcons.minus,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: MediaQuery.paddingOf(context).bottom + 20,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Continue'),
        ),
      ),
    );
  }
}
