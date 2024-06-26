import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class PetsRemoteDatabase {
  Future<void> savePetImage(String petId, String path);
  Future<Pet> create(Pet pet);
  Future<List<Pet>> list(String uid);
  Future<List<Species>> listSpecies(String languageCode);
  Future<List<Breed>> listBreeds(String languageCode, String speciesId);
  Future<Breed> retrieveBreed(String languageCode, String breedId, String speciesId);
}

class PetsRemoteDatabaseImpl implements PetsRemoteDatabase {
  @override
  Future<void> savePetImage(String petId, String path) async {
    throw UnimplementedError();
  }

  @override
  Future<Pet> create(Pet pet) async {
    final reponse = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.pets)
        .add(pet.toJson());

    await reponse.update({'id': reponse.id});

    return pet.copyWith(id: reponse.id);
  }

  @override
  Future<List<Pet>> list(String uid) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.pets)
        .where('owner', isEqualTo: uid)
        .get();

    return response.docs.map((e) => Pet.fromJson(e.data())).toList();
  }

  @override
  Future<List<Species>> listSpecies(String languageCode) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.species)
        .orderBy('name')
        .get();

    final species = <Species>[];

    for (final doc in response.docs) {
      final json = doc.data();
      json['name'] = json['name'][languageCode];

      species.add(Species.fromJson(json));
    }

    return species;
  }

  @override
  Future<List<Breed>> listBreeds(String languageCode, String speciesId) async {
    QuerySnapshot<Map<String, dynamic>> response;

    response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.species)
        .doc(speciesId)
        .collection(FirebaseCollectionReferences.breeds)
        .orderBy('id')
        .get();

    final breeds = <Breed>[];

    for (final doc in response.docs) {
      final json = doc.data();
      json['name'] = doc['name'][languageCode];

      breeds.add(Breed.fromJson(json));
    }

    return breeds;
  }

  @override
  Future<Breed> retrieveBreed(String languageCode, String breedId, String speciesId) async {
    final reponse = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.species)
        .doc(speciesId)
        .collection(FirebaseCollectionReferences.breeds)
        .doc(breedId)
        .get();

    final json = reponse.data()!;

    json['name'] = json['name'][languageCode];

    return Breed.fromJson(json);
  }
}
