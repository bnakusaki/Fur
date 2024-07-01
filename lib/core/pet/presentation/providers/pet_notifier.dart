import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pet_notifier.g.dart';

@riverpod
class PetNotifier extends _$PetNotifier {
  @override
  Pet? build() => null;

  void set(Pet pet) {
    state = pet;
  }

  void update(Pet Function(Pet? pet) func) {
    state = func(state);
  }

  void clear() {
    state = null;
  }
}
