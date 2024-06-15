import 'package:flutter/material.dart';
import 'package:fur/common_libs.dart';
import 'package:fur/shared/assets/app_images.dart';
import 'package:fur/src/dog/entities/dog_breeds.dart';
import 'package:fur/src/dog/presentation/interface/screens/select_dog_age_screen.dart';

class DogBreedCard extends StatelessWidget {
  const DogBreedCard({
    super.key,
    required this.breed,
  });

  final DogBreed breed;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    String getBreedImage() {
      return switch (breed) {
        DogBreed.germanShepherd => DogBreedsImages.germanShepherd,
        DogBreed.bulldog => DogBreedsImages.bulldog,
        DogBreed.labradorRetriever => DogBreedsImages.labradorRetriever,
        DogBreed.goldenRetriever => DogBreedsImages.goldenRetriever,
        DogBreed.frenchBulldog => DogBreedsImages.frenchBulldog,
        DogBreed.siberianHusky => DogBreedsImages.siberianHusky,
        DogBreed.beagle => DogBreedsImages.beagle,
        DogBreed.alaskanMalamute => DogBreedsImages.alaskanMalamute,
        DogBreed.poodle => DogBreedsImages.poodle,
        DogBreed.chihuahua => DogBreedsImages.chihuahua,
        DogBreed.australianCattleDog => DogBreedsImages.australianCattleDog,
        DogBreed.dachshund => DogBreedsImages.dachshund,
        DogBreed.borderCollie => DogBreedsImages.borderCollie,
        DogBreed.airedaleTerrier => DogBreedsImages.airedaleTerrier,
        DogBreed.rottweiler => DogBreedsImages.rottweiler,
        DogBreed.americanStaffordshireTerrier => DogBreedsImages.americanStaffordshireTerrier,
        DogBreed.australianShepherd => DogBreedsImages.australianShepherd,
        DogBreed.boxer => DogBreedsImages.boxer,
        DogBreed.affenpinscher => DogBreedsImages.affenpinscher,
        DogBreed.greatDane => DogBreedsImages.greatDane,
        DogBreed.bichonFrise => DogBreedsImages.bichonFrise,
        DogBreed.englishCockerSpaniel => DogBreedsImages.englishCockerSpanie,
        DogBreed.malteseDog => DogBreedsImages.malteseDog,
        DogBreed.chowChow => DogBreedsImages.chowchow,
        DogBreed.afghanHound => DogBreedsImages.afghanHound,
        DogBreed.americanEskimoDog => DogBreedsImages.americanEskimoDog,
        DogBreed.yorkshireTerrier => DogBreedsImages.yorkshireTerrier,
        DogBreed.pomeranian => DogBreedsImages.pomeranian,
        DogBreed.anatolianShepherdDog => DogBreedsImages.anatolianShepherdDog,
        DogBreed.cavalierKingCharlesSpaniel => DogBreedsImages.cavalierKingCharlesSpaniel,
        DogBreed.pembrokeWelshCorgi => DogBreedsImages.pembrokeWelshCorgi,
        DogBreed.bullTerrier => DogBreedsImages.bullTerrier,
        DogBreed.bassetHound => DogBreedsImages.bassetHound,
        DogBreed.basenji => DogBreedsImages.basenji,
        DogBreed.havanese => DogBreedsImages.havanese,
        DogBreed.newfoundlandDog => DogBreedsImages.blackNewfoundlandDog,
        DogBreed.belgianShepherd => DogBreedsImages.belgianShepherd,
        DogBreed.bostonTerrier => DogBreedsImages.bostonTerrier,
        DogBreed.cairnTerrier => DogBreedsImages.cairnTerrier,
        DogBreed.bullmastiff => DogBreedsImages.bullmastiff,
        DogBreed.brittanySpaniel => DogBreedsImages.brittanySpaniel,
        DogBreed.sheltie => DogBreedsImages.sheltie,
        DogBreed.blackRussianTerrier => DogBreedsImages.blackRussianTerrier,
        DogBreed.bedlingtonTerrier => DogBreedsImages.bedlingtonTerrier,
        DogBreed.americanPitBullTerrier => DogBreedsImages.americanPitBullTerrier,
        DogBreed.doberman => DogBreedsImages.doberman,
        DogBreed.sarabiDog => DogBreedsImages.sarabiDog,
        DogBreed.somayed => DogBreedsImages.somayed,
        DogBreed.americanBully => DogBreedsImages.americanBully,
        DogBreed.maltipoo => DogBreedsImages.maltipoo,
        DogBreed.borzoi => DogBreedsImages.borzoi,
        _ => throw ArgumentError('${breed.name} does not have an assigned image')
      };
    }

    String getBreedName() {
      return switch (breed) {
        DogBreed.affenpinscher => localizations.affenpinscher,
        DogBreed.afghanHound => localizations.afghanHound,
        DogBreed.airedaleTerrier => localizations.airedaleTerrier,
        DogBreed.alaskanMalamute => localizations.alaskanMalamute,
        DogBreed.americanBully => localizations.americanBully,
        DogBreed.americanEskimoDog => localizations.americanEskimoDog,
        DogBreed.americanPitBullTerrier => localizations.americanPitBullTerrier,
        DogBreed.americanStaffordshireTerrier => localizations.americanStaffordshireTerrier,
        DogBreed.anatolianShepherdDog => localizations.anatolianShepherdDog,
        DogBreed.australianCattleDog => localizations.australianCattleDog,
        DogBreed.australianShepherd => localizations.australianShepherd,
        DogBreed.bassetHound => localizations.bassetHound,
        DogBreed.basenji => localizations.basenji,
        DogBreed.beagle => localizations.beagle,
        DogBreed.bedlingtonTerrier => localizations.bedlingtonTerrier,
        DogBreed.belgianShepherd => localizations.belgianShepherd,
        DogBreed.bichonFrise => localizations.bichonFrise,
        DogBreed.blackRussianTerrier => localizations.blackRussianTerrier,
        DogBreed.borderCollie => localizations.borderCollie,
        DogBreed.borzoi => localizations.borzoi,
        DogBreed.bostonTerrier => localizations.bostonTerrier,
        DogBreed.boxer => localizations.boxer,
        DogBreed.brittanySpaniel => localizations.brittanySpaniel,
        DogBreed.bullTerrier => localizations.bullTerrier,
        DogBreed.bulldog => localizations.bulldog,
        DogBreed.bullmastiff => localizations.bullmastiff,
        DogBreed.cairnTerrier => localizations.cairnTerrier,
        DogBreed.cavalierKingCharlesSpaniel => localizations.cavalierKingCharlesSpaniel,
        DogBreed.chihuahua => localizations.chihuahua,
        DogBreed.chowChow => localizations.chowChow,
        DogBreed.dachshund => localizations.dachshund,
        DogBreed.doberman => localizations.doberman,
        DogBreed.englishCockerSpaniel => localizations.englishCockerSpaniel,
        DogBreed.frenchBulldog => localizations.frenchBulldog,
        DogBreed.germanShepherd => localizations.germanShepherd,
        DogBreed.goldenRetriever => localizations.goldenRetriever,
        DogBreed.greatDane => localizations.greatDane,
        DogBreed.havanese => localizations.havanese,
        DogBreed.labradorRetriever => localizations.labradorRetriever,
        DogBreed.malteseDog => localizations.malteseDog,
        DogBreed.maltipoo => localizations.maltipoo,
        DogBreed.newfoundlandDog => localizations.newfoundlandDog,
        DogBreed.pembrokeWelshCorgi => localizations.pembrokeWelshCorgi,
        DogBreed.pomeranian => localizations.pomeranian,
        DogBreed.poodle => localizations.poodle,
        DogBreed.rottweiler => localizations.rottweiler,
        DogBreed.sarabiDog => localizations.sarabiDog,
        DogBreed.sheltie => localizations.sheltie,
        DogBreed.siberianHusky => localizations.siberianHusky,
        DogBreed.somayed => localizations.somayed,
        DogBreed.yorkshireTerrier => localizations.yorkshireTerrier,
        _ => breed.name,
      };
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Expanded(
            child: Card(
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectDogAgeScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        getBreedImage(),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            getBreedName(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }
}
