import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/shared/firebase_collection_references.dart';

abstract class AnimalsRemoteDatabase {
  Future<List<Animal>> listAnimals(String languageCode);
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
      final imageDownloadUrl = await FirebaseStorage.instance
          .ref()
          .child('animals')
          .child(json['imageUrl'])
          .getDownloadURL();

      json['imageUrl'] = imageDownloadUrl;

      animals.add(Animal.fromJson(json));
    }

    return animals;
  }
}
