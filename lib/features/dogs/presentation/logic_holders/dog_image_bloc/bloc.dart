import 'package:flambu_test/features/dogs/domain/use_cases/get_random_dog_image.dart';
import 'package:flambu_test/features/dogs/presentation/logic_holders/dog_image_bloc/event.dart';
import 'package:flambu_test/features/dogs/presentation/logic_holders/dog_image_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImageBloc extends Bloc<DogImageEvent, DogImageState> {
  final GetRandomDogImageUseCase getRandomDogImage;
  DogImageBloc({
    required this.getRandomDogImage,
  }) : super(EmptyImage()) {
    on<GetDogImage>((event, emit) async {
      emit(LoadingImage());
      final result = await getRandomDogImage();
      result.fold(
        (failure) => emit(ErrorLoadingImage()),
        (entity) => emit(
          LoadedImage(stateObject: entity),
        ),
      );
    });
  }
}
