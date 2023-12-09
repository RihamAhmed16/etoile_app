import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<List<String>> {
  CartCubit() : super([]);

  void addToCart(String product) {
    final updatedCart = [...state, product];
    emit(updatedCart);
  }

  void removeFromCart(String product) {
    final updatedCart = List.from(state)..remove(product);
    emit(updatedCart);
  }
}