import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fur/core/animals/data/databases/animals_remote_database.dart';
import 'package:fur/core/animals/domain/entities/animal.dart';
import 'package:fur/core/animals/domain/entities/breed.dart';
import 'package:fur/core/animals/domain/repositories/animals_repository.dart';
import 'package:fur/shared/exceptions/error_codes.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/platform/network_info.dart';
import 'package:logger/web.dart';

class AnimalsRepositoryImpl implements AnimalsRepository {
  final NetworkInfo networkInfo;
  final AnimalsRemoteDatabase remoteDatabase;

  AnimalsRepositoryImpl(this.networkInfo, this.remoteDatabase);

  @override
  Future<Either<Failure, List<Animal>>> listAnimals(String languageCode) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.listAnimals(languageCode);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, List<Breed>>> listBreeds(String languageCode, String animalId) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.listBreeds(languageCode, animalId);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      Logger().e(e);
      return Left(Failure(ErrorCodes.unknownError));
    }
  }
}
