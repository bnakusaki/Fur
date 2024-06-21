import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/presentation/bloc/animals_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_breeds.g.dart';

@riverpod
Future<List<Breed>> listBreeds(
    ListBreedsRef ref, String languageCode, String animalId, Breed? last) async {
  final bloc = sl<AnimalsBloc>();

  final response = await bloc.listBreeds(languageCode, animalId, last);

  return response.fold(
    (failure) => throw failure,
    (breeds) => breeds,
  );
}
