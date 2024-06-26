import 'package:freezed_annotation/freezed_annotation.dart';

part 'species.freezed.dart';
part 'species.g.dart';

@freezed
class Species with _$Species {
  const factory Species({
    required String id,
    required String name,
    required String imageUrl,
  }) = _Species;

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);

  factory Species.empty() => const Species(
        id: '',
        name: '',
        imageUrl: '',
      );
}
