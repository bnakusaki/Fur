import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fur/core/pet/domain/entities/breed.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/species.dart';
import 'package:fur/shared/firebase_collection_references.dart';
import 'package:logger/logger.dart';

abstract class PetsRemoteDatabase {
  Future<String> savePetImage(String petId, File image);
  Future<Pet> create(Pet pet);
  Future<Pet> update(Pet pet);
  Future<List<Pet>> list(String uid);
  Future<List<Species>> listSpecies(String languageCode);
  Future<List<Breed>> listBreeds(String languageCode, String speciesId);
  Future<Breed> retrieveBreed(String languageCode, String breedId, String speciesId);
  Future<Species> retrieveSpecies(String languageCode, String speciesId);
}

class PetsRemoteDatabaseImpl implements PetsRemoteDatabase {
  @override
  Future<String> savePetImage(String petId, File image) async {
    final storageRef = FirebaseStorage.instance.ref();
    final childRef = storageRef.child(FirebaseCollectionReferences.petImages).child(petId);
    await childRef.putFile(image);

    final downloadUrl = await childRef.getDownloadURL();
    FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.pets)
        .doc(petId)
        .update({'image': downloadUrl});

    return downloadUrl;
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

    Logger().d(speciesId);
    Logger().d(breedId);

    final json = reponse.data()!;

    json['name'] = json['name'][languageCode];

    return Breed.fromJson(json);
  }

  @override
  Future<Species> retrieveSpecies(String languageCode, String speciesId) async {
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.species)
        .doc(speciesId)
        .get();

    final json = doc.data()!;
    json['name'] = json['name'][languageCode];

    return Species.fromJson(json);
  }

  @override
  Future<Pet> update(Pet pet) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.pets)
        .doc(pet.id)
        .update(pet.toJson());

    return pet;
  }
}
