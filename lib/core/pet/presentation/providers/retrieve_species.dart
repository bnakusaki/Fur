import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'retrieve_species.g.dart';

@riverpod
Future<Species> retrieveSpecies(
  RetrieveSpeciesRef ref,
  String languageCode,
  String speciesId,
) async {
  final bloc = sl<PetsBloc>();

  final result = await bloc.retrieveSpecies(languageCode, speciesId);

  return result.fold(
    (failure) => throw failure,
    (species) => species,
  );
}
