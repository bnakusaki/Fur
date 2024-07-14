import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_breeds.g.dart';

@riverpod
Future<List<PetBreed>> listBreeds(ListBreedsRef ref, String languageCode) async {
  final bloc = sl<PetsBloc>();

  final response = await bloc.listPetBreeds(languageCode);

  return response.fold(
    (failure) => throw failure,
    (breeds) => breeds,
  );
}
