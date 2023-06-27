import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/cart/ui/cart.dart';
import 'package:my_app/features/home/bloc/home_bloc.dart';
import 'package:my_app/features/home/ui/product_tile.dart';
import 'package:my_app/features/wishlist/ui/wishlist.dart';
import 'package:my_app/models/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeProductWishlistActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Added to Wishlis")));
        } else if (state is HomeCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Added to Cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(actions: [
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishlistNavigateEvent());
                    },
                    icon: const Icon(Icons.favorite)),
                IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined)),
              ], title: const Text("Grocery App")),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: ((context, index) {
                    return ProductTile(
                      product: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  })),
            );
          case HomeErrorState:
            return const Center(
              child: Text("Error"),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
