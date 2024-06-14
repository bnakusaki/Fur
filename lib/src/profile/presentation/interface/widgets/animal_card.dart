import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fur/shared/assets/app_icons.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Card(
        elevation: 0,
        color: Colors.transparent,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 4,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: SvgPicture.asset(
                    AnimalIcons.dog,
                    height: constraints.maxHeight - 80,
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 10),
                const Text(
                  'Dog',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
