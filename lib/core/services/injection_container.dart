import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_project/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_project/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:tdd_project/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_project/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_project/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_project/src/authentication/presentation/cubit/authentication_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    // App Logic
    ..registerFactory(() => AuthenticationCubit(
          createUser: sl(),
          getUsers: sl(),
        ))

    // Use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))

    // Repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
