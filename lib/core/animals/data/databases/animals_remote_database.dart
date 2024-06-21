import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class AnimalsRemoteDatabase {
  Future<List<Animal>> listAnimals(String languageCode);
  Future<List<Breed>> listBreeds(String languageCode, String animalId);
}

class AnimalsRemoteDatabaseImpl implements AnimalsRemoteDatabase {
  @override
  Future<List<Animal>> listAnimals(String languageCode) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.animals)
        .orderBy('name')
        .get();

    final animals = <Animal>[];

    for (final doc in response.docs) {
      final json = doc.data();
      json['name'] = json['name'][languageCode];
      String imageDownloadUrl = '';
      try {
        imageDownloadUrl = await FirebaseStorage.instance
            .ref()
            .child('animals')
            .child(json['imageUrl'])
            .getDownloadURL();
      } catch (e) {
        ///
      }

      json['imageUrl'] = imageDownloadUrl;

      animals.add(Animal.fromJson(json));
    }

    return animals;
  }

  @override
  Future<List<Breed>> listBreeds(String languageCode, String animalId) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.breeds)
        .doc(animalId)
        .get();

    final breeds = <Breed>[];

    for (final data in response.data()?['breeds']) {
      data['name'] = data['name'][languageCode];
      String imageDownloadUrl = '';
      try {
        imageDownloadUrl = await FirebaseStorage.instance
            .ref()
            .child('animal_breeds')
            .child(data['imageUrl'])
            .getDownloadURL();
      } catch (e) {
        ///
      }

      data['imageUrl'] = imageDownloadUrl;

      breeds.add(Breed.fromJson(data));
    }

    return breeds;
  }
}
