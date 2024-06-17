import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fur/shared/exceptions/error_codes.dart';
import 'package:fur/shared/exceptions/failure.dart';
import 'package:fur/shared/platform/network_info.dart';
import 'package:fur/src/profile/data/databases/profile_remote_database.dart';
import 'package:fur/src/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDatabase remoteDatabase;

  ProfileRepositoryImpl(
    this.networkInfo,
    this.remoteDatabase,
  );

  @override
  Future<Either<Failure, void>> addProfilePicture(String path, String uid) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.addProfilePicture(path, uid);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }

  @override
  Future<Either<Failure, bool>> hasProfile(String uid) async {
    try {
      await networkInfo.hasInternet();
      final response = await remoteDatabase.hasProfile(uid);
      return Right(response);
    } on FirebaseException catch (e) {
      return Left(Failure(e.code));
    } catch (e) {
      return Left(Failure(ErrorCodes.unknownError));
    }
  }
}
