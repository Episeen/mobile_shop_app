import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_selling_app/features/home/models/main_model.dart';
import '../../../core/services/api.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Api api;

  HomeBloc(this.api) : super(const HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(
          fetch: () async {
            emit(const _Loading());
            try {
              var phoneModels = await api.fetchMainData();
              emit(_Loaded(phoneModels));
            } catch (e) {
              log(e.toString(), name: 'Home Bloc Fetch');
              emit(_Error(e.toString()));
            }
          }
      );
    });
  }
}