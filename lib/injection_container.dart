import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/platform/network_info.dart';
import 'package:rick_and_morty_app/features/home/data/datasources/rick_and_morty_remote_data_source.dart';
import 'package:rick_and_morty_app/features/home/data/repositories/rick_and_morty:repository_impl.dart';
import 'package:rick_and_morty_app/features/home/domain/repositories/rick_and_morty_repository.dart';
import 'package:rick_and_morty_app/features/home/domain/usecases/usecases.dart';
import 'package:rick_and_morty_app/features/home/presentation/bloc/home/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  //Bloc
  sl.registerFactory(
    () => HomeBloc(
      getAllCharacters: sl(),
      getNextOrPrevCharacters: sl(),
      getAllCharactersGender: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetAllCharacters(sl()));
  sl.registerLazySingleton(() => GetNextOrPrevCharacters(sl()));
  sl.registerLazySingleton(() => GetAllCharactersGender(sl()));

  // Repository
  sl.registerLazySingleton<RickAndMortyRepository>(
    () => RickAndMortyRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RickAndMortyRemoteDataSource>(
    () => RickAndMortyRemoteDataSourceImpl(client: sl()),
  );

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
