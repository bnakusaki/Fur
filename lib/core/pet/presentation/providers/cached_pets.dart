import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cached_pets.g.dart';

@riverpod
class CachedPets extends _$CachedPets {
  @override
  List<Pet> build() => [];

  void set(List<Pet> pets) {
    state = pets;
    _sort();
  }

  void add(Pet pet) {
    state = [...state, pet];
    _sort();
  }

  void updatePet(Pet pet) {
    state.removeWhere((element) => element.id == pet.id);
    state = [...state, pet];
    _sort();
  }

  void _sort() {
    state.sort((Pet a, Pet b) => a.name.compareTo(b.name));
    state = [...state];
  }
}
