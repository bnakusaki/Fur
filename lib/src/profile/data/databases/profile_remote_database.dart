import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fur/shared/firebase_collection_references.dart';
import 'package:fur/src/authentication/domain/entities/user.dart';

abstract class ProfileRemoteDatabase {
  Future<void> addProfilePicture(String path, String uid);
  Future<bool> hasProfile(String uid);
  Future<User> create(User user);
  Future<User> retrieve(String uid);
  Future<User> update(User user);
}

class ProfileRemoteDatabaseImpl implements ProfileRemoteDatabase {
  @override
  Future<void> addProfilePicture(String path, String uid) async {
    File file = File(path);

    final storageRef = FirebaseStorage.instance.ref();
    final profilePicturesRef = storageRef.child('profile_pictures/$uid');

    final uploadTask = profilePicturesRef.putFile(file);

    await uploadTask;

    FirebaseAuth.instance.currentUser?.updatePhotoURL(file.uri.pathSegments.last);
    return;
  }

  @override
  Future<bool> hasProfile(String uid) async {
    return await FirebaseFirestore.instance.collection('users').doc(uid).get().then((doc) {
      return doc.exists;
    });
  }

  @override
  Future<User> create(User user) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.userProfiles)
        .doc(user.id)
        .set(user.toJson());

    return user;
  }

  @override
  Future<User> retrieve(String uid) async {
    final response = await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.userProfiles)
        .doc(uid)
        .get();

    return User.fromJson(response.data()!);
  }

  @override
  Future<User> update(User user) async {
    final currentUser = FirebaseAuth.instance.currentUser!;

    await FirebaseFirestore.instance
        .collection(FirebaseCollectionReferences.userProfiles)
        .doc(user.id)
        .update(user.toJson());

    currentUser.updateDisplayName('${user.firstName} ${user.middleName ?? ''} ${user.lastName}');

    return user;
  }
}
