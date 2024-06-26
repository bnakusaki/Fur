import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/presentation/bloc/animals_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'retrieve_breed.g.dart';

@riverpod
Future<Breed> retrieveBreed(
  RetrieveBreedRef ref,
  String languageCode,
  String animalId,
  String breedId,
) async {
  final bloc = sl<AnimalsBloc>();

  final result = await bloc.retrieveBreed(languageCode, breedId, animalId);

  return result.fold(
    (failure) => throw failure,
    (breed) => breed,
  );
}
