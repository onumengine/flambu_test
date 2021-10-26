import 'package:flambu_test/core/network/network_info.dart';
import 'package:flambu_test/features/dogs/data/data_sources/breed_list_local_data_source.dart';
import 'package:flambu_test/features/dogs/data/data_sources/breed_list_remote_data_source.dart';
import 'package:flambu_test/features/dogs/data/repositories/dogs_list_repo_impl.dart';
import 'package:flambu_test/features/dogs/data/repositories/random_dog_image_repo_impl.dart';
import 'package:flambu_test/features/dogs/domain/repositories/dogs_list_repository.dart';
import 'package:flambu_test/features/dogs/domain/repositories/random_dog_image_repository.dart';
import 'package:flambu_test/features/dogs/domain/use_cases/get_dog_breeds.dart';
import 'package:flambu_test/features/dogs/domain/use_cases/get_random_dog_image.dart';
import 'package:flambu_test/features/dogs/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

void init() {
  initFeatures();
  initCore();
  initExternal();
}

void initFeatures() {
  // BLoC
  // I registered this BLoC as a factory because it has cleanup logic callbacks
  // and I don't want to reuse the same bloc after its cleanp code has ben run
  serviceLocator.registerFactory(
    () => BreedListBloc(
      getDogBreeds: serviceLocator(),
      getRandomDogImage: serviceLocator(),
    ),
  );
  
  // Use cases
  serviceLocator.registerLazySingleton(
    () => GetDogBreedsUseCase(
      dogsListRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => GetRandomDogImageUseCase(
      randomDogImageRepository: serviceLocator(),
    ),
  );
  
  // Repositories
  serviceLocator.registerLazySingleton<DogsListRepository>(
    () => DogsListRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<RandomDogImageRepository>(
    () => RandomDogImageRepositoryImpl(
      remoteDataSource: serviceLocator(),
      localDataSource: serviceLocator(),
      networkInfo: serviceLocator(),
    ),
  );
  
  // Data sources
  serviceLocator.registerLazySingleton<BreedListRemoteDataSource>(() => BreedListRemoteDataSourceImpl(client: serviceLocator(),),);
  serviceLocator.registerLazySingleton<BreedListLocalDataSource>(() => BreedListLocalDataSourceImpl(serviceLocator(),),);
}

void initCore() {
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      serviceLocator(),
    ),
  );
}

Future<void> initExternal() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => Client());
}
