part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final Product clickedProduct;

  HomeProductWishlistButtonClickedEvent(this.clickedProduct);
}

class HomeCartButtonClickedEvent extends HomeEvent {
  final Product clickedProduct;

  HomeCartButtonClickedEvent(this.clickedProduct);
}

class HomeProductWishlistNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
