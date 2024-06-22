abstract class PetsRemoteDatabase {
  Future<void> savePetImage(String petId, String path);
}

class PetsRemoteDatabaseImpl implements PetsRemoteDatabase {
  @override
  Future<void> savePetImage(String petId, String path) async {
    throw UnimplementedError();
  }
}
