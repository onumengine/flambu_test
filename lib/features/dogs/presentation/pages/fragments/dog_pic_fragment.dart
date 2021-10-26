
import 'package:flambu_test/features/dogs/presentation/logic_holders/dog_image_bloc/bloc.dart';
import 'package:flambu_test/features/dogs/presentation/logic_holders/dog_image_bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogPicFragment extends StatelessWidget {
  const DogPicFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogImageBloc, DogImageState>(
      builder: (context, state) {
        if (state is EmptyImage) {
          return const Center(
            child: Center(
              child: Text('Empty state'),
            ),
          );
        } else if (state is LoadingImage) {
          return const Center(child: CircularProgressIndicator(),);
        } else if (state is LoadedImage) {
          return Image.network(state.stateObject.imageLink);
        }
        return const Center(
          child: Center(
            child: Text('Undefined state'),
          ),
        );
      }
    );
  }
}
