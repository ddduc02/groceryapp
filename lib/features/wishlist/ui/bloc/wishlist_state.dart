part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadedSuccessState extends WishlistState {
  final List<Product> wishlist;

  WishlistLoadedSuccessState(this.wishlist);
}

class WishlistRemoveItemActionState extends WishlistActionState {}
