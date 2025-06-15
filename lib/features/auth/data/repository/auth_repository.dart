import 'package:fpdart/fpdart.dart';
import 'package:test/core/error/failures.dart';
import 'package:test/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:test/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, String>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
    } catch (e) {}
  }
}
