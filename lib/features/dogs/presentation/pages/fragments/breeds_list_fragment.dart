import 'package:flambu_test/features/dogs/presentation/bloc/bloc.dart';
import 'package:flambu_test/features/dogs/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsListFragment extends StatelessWidget {
  const BreedsListFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedListBloc, BreedListState>(
        builder: (context, state) {
      if (state is Empty) {
        return const Center(child: Text('Empty State'),);
      } else if (state is Loading) {
        return const Center(child: CircularProgressIndicator(),);
      } else if (state is Loaded) {
        List<String> dogBreeds = state.listOfBreeds;
        return ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: Text(dogBreeds[index]),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: dogBreeds.length,
        );
      } else if (state is LoadingError) {
        return Center(
          child: Text(state.errorMessage),
        );
      } else {
        return const Center(
          child: Text('Unknown error'),
        );
      }
    });
  }
}
