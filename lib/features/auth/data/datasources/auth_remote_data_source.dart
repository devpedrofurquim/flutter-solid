import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/core/error/exception.dart';

abstract interface class IAuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSource(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {'name': name},
      );

      final user = response.user;
      if (user == null) {
        throw const ServerException('User is null');
      }
      return user.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
