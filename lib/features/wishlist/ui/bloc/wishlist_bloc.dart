import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/data/cart_items.dart';
import 'package:my_app/data/wishlist_items.dart';

import '../../../../models/product.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitial);
  }

  FutureOr<void> wishlistInitial(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistLoadedSuccessState(wishlistItems));
  }
}
