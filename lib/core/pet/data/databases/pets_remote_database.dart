import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class PetsRemoteDatabase {
  Future<void> savePetImage(String petId, String path);
  Future<Pet> create(Pet pet);
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
}
