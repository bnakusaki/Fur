import 'package:flutter/material.dart';
import 'package:fur/shared/styles/text_styles.dart';
import 'package:fur/shared/widgets/app_back_button.dart';

class SelectDogAgeScreen extends StatelessWidget {
  const SelectDogAgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).extension<TextStyles>()!;

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
                      child: ListView(
                        children: List.generate(
                          100,
                          (index) => Center(
                            child: Text(
                              index.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: List.generate(
                          100,
                          (index) => Center(
                            child: Text(
                              index.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
