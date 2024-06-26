import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_species.g.dart';

@riverpod
Future<List<Species>> listSpecies(ListSpeciesRef ref, String languageCode) async {
  final bloc = sl<PetsBloc>();

  final response = await bloc.listspecies(languageCode);

  return response.fold(
    (failure) => throw failure,
    (species) => species,
  );
}
