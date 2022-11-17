import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:players/core/network/dio_helper.dart';
import 'package:players/data/data_source/posts_remote_data_sources.dart';
import 'package:players/data/repositories/players_repository.dart';

import '../core/network/network_checker.dart';
import '../cubit/app_cubit.dart';

var instance = GetIt.instance;

Future<void> init() async {
  // bloc
  instance.registerFactory(() => AppCubit(playersRepository: instance()));

  // Repository
  instance.registerLazySingleton(() => PlayersRepository(
      baseRemoteDataSource: instance(), networkChecker: instance()));

  // Core
  instance.registerLazySingleton<BaseNetworkChecker>(
      () => NetworkChecker(instance()));
  instance.registerLazySingleton(() => DioHelper(dio: instance()));

  // DataSources
  instance.registerLazySingleton<BaseRemoteDataSource>(
      () => RemoteDataSource(dioHelper: instance()));

  // external
  instance.registerLazySingleton<Dio>(() => Dio());
  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}
