import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/presentation/bloc/animals_bloc.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_animals.g.dart';

@riverpod
Future<List<Animal>> listAnimals(ListAnimalsRef ref, String languageCode) async {
  final bloc = sl<AnimalsBloc>();

  final response = await bloc.listAnimals(languageCode);

  return response.fold(
    (failure) => throw failure,
    (animals) => animals,
  );
}
