import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/features/wishlist/ui/bloc/wishlist_bloc.dart';
import 'package:my_app/features/wishlist/ui/wishlisttile.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is! WishlistActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadedSuccessState:
            final successState = state as WishlistLoadedSuccessState;
            print("Check WishlistLoadedSuccessState ");
            return Scaffold(
              appBar: AppBar(
                title: const Text("Wishlist"),
              ),
              body: ListView.builder(
                  itemCount: successState.wishlist.length,
                  itemBuilder: ((context, index) {
                    print("check list wish ${successState.wishlist[index].id}");
                    return WishlistTile(
                      product: successState.wishlist[index],
                      wishlistBloc: wishlistBloc,
                    );
                  })),
            );

          default:
            return const Center(child: Text("Chua co du lieu"));
        }
      },
    );
  }
}
