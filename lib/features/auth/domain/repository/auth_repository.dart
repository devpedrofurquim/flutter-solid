import 'package:fpdart/fpdart.dart';
import 'package:test/core/error/failures.dart';
// The difference between abstract interface and abstract class
// Its meant to define a contract
// Meant to be implemented by other classes

abstract interface class AuthRepository {
  Future<Either<Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });

  Future<Either<Failures, String>> loginWithEmailPassword({
    required String email,
    required String password
  });
} 