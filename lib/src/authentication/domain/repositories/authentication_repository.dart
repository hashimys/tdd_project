import 'package:dartz/dartz.dart';
import 'package:tdd_project/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<Either<Unit, Unit>> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<(Exception, List<User>)> getUsers();
}
