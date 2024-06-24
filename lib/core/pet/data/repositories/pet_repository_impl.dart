import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fur/core/pet/data/databases/pets_remote_database.dart';
import 'package:fur/core/pet/domain/entities/pet.dart';
import 'package:fur/core/pet/domain/repositories/pet_repository.dart';
import 'package:fur/shared/exceptions/error_codes.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/platform/network_info.dart';

class PetsRepositoryImpl implements PetsRepository {
  final NetworkInfo networkInfo;
  final PetsRemoteDatabase remoteDatabase;

  PetsRepositoryImpl(this.networkInfo, this.remoteDatabase);

  @override
  Future<Either<Failure, void>> savePetImage(String petId, String path) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.savePetImage(petId, path);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, Pet>> create(Pet pet) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.create(pet);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }
}
