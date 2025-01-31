import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/presentation/bloc/pets_bloc.dart';
import 'package:fur/core/pet/presentation/providers/cached_pets.dart';
import 'package:fur/injection_container.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_pets.g.dart';

@riverpod
Future<List<Pet>> listPets(ListPetsRef ref, String uid) async {
  final bloc = sl<PetsBloc>();

  final response = await bloc.list(uid);

  return response.fold(
    (failure) => throw failure,
    (pets) {
      ref.watch(cachedPetsProvider.notifier).set(pets);
      return pets;
    },
  );
}
