import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/data/cart_items.dart';
import 'package:my_app/data/grocery_data.dart';
import 'package:my_app/data/wishlist_items.dart';

import '../../../models/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductWishlistNavigateEvent>(homeProductWishlistNavigateEvent);
    on<HomeCartButtonClickedEvent>(homeCartButtonClickedEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(GroceryData.groceryProducts
        .map((e) => Product(
            e['id'], e['name'], e['description'], e['price'], e['imgUrl']))
        .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("wishlist button clicked");
    wishlistItems.add(event.clickedProduct);
    print("Check wishlist + ${wishlistItems[0]}");
    emit(HomeProductWishlistActionState());
  }

  FutureOr<void> homeProductWishlistNavigateEvent(
      HomeProductWishlistNavigateEvent event, Emitter<HomeState> emit) {
    print("wishlist navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonClickedEvent(
      HomeCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart button clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeCartedActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("cart navigate clicked");
    emit(HomeNavigateToCartPageActionState());
  }
}
