import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class PetsRemoteDatabase {
  Future<void> savePetImage(String petId, String path);
  Future<Pet> create(Pet pet);
  Future<List<Pet>> list(String uid);
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
}
