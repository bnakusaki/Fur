import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/entities/pet_breed.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class PetsRemoteDatabase {
  Future<Pet> create(Pet pet);
  Future<Pet> update(Pet pet);
  Future<List<Pet>> list(String uid);
  Future<String> savePetImage(String petId, File image);
  Future<List<PetBreed>> listPetBreeds(String languageCode);
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
  Future<List<PetBreed>> listPetBreeds(String languageCode) async {
    // QuerySnapshot<Map<String, dynamic>> response;

    // response = await FirebaseFirestore.instance
    //     .collection(FirebaseCollectionReferences.species)
    //     .collection(FirebaseCollectionReferences.breeds)
    //     .orderBy('id')
    //     .get();

    // final breeds = <PetBreed>[];

    // for (final doc in response.docs) {
    //   final json = doc.data();
    //   json['name'] = doc['name'][languageCode];

    //   breeds.add(PetBreed.fromJson(json));
    // }

    // return breeds;
    throw UnimplementedError();
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
