import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_selling_app/features/phone_details/models/phone_details.dart';
import '../../../core/services/api.dart';

part 'details_event.dart';
part 'details_state.dart';
part 'details_bloc.freezed.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final Api api;

  DetailsBloc(this.api) : super(const DetailsState.initial()) {
    on<DetailsEvent>((event, emit) async {
      await event.when(
          fetch: () async {
            emit(const _Loading());
            try {
              var phoneDetails = await api.fetchPhoneDetails();
              emit(_Loaded(phoneDetails));
            } catch (e) {
              log(e.toString(), name: 'PhoneDetails Bloc Fetch');
              emit(_Error(e.toString()));
            }
          }
      );
    });
  }
}
