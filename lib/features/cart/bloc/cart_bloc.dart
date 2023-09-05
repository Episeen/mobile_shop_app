import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/services/api.dart';
import '../models/product_model.dart';

part 'cart_event.dart';

part 'cart_state.dart';

part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Api api;

  CartBloc(this.api) : super(const CartState.initial()) {
    on<CartEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            var products = await api.fetchProducts();
            emit(_Loaded(products));
          } catch (e) {
            log(e.toString(), name: 'Cart Bloc Fetch');
            emit(_Error(e.toString()));
          }
        },
      );
    });
  }
}
