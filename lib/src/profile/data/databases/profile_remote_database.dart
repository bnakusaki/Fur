import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ProfileRemoteDatabase {
  Future<void> addProfilePicture(String path, String uid);
  Future<bool> hasProfile(String uid);
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
}
