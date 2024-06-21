import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_pet_form_notifier.g.dart';

@riverpod
class AddPetFormNotifier extends _$AddPetFormNotifier {
  @override
  Pet build() => Pet.empty();

  void clear() {
    state = Pet.empty();
  }

  void update(Pet Function(Pet pet) func) {
    state = func(state);
  }

  void set(Pet pet) {
    state = pet;
  }
}
