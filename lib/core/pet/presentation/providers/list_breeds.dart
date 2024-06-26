import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_breeds.g.dart';

@riverpod
Future<List<Breed>> listBreeds(ListBreedsRef ref, String languageCode, String speciesId) async {
  final bloc = sl<PetsBloc>();

  final response = await bloc.listBreeds(languageCode, speciesId);

  return response.fold(
    (failure) => throw failure,
    (breeds) => breeds,
  );
}
