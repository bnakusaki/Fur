import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'retrieve_breed.g.dart';

@riverpod
Future<Breed> retrieveBreed(
  RetrieveBreedRef ref,
  String languageCode,
  String speciesId,
  String breedId,
) async {
  final bloc = sl<PetsBloc>();

  final result = await bloc.retrieveBreed(languageCode, breedId, speciesId);

  return result.fold(
    (failure) => throw failure,
    (breed) => breed,
  );
}
