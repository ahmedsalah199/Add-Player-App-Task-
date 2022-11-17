import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players/core/error/error_handler_message.dart';

import '../core/error/failures.dart';
import '../core/utils/app_constants.dart';
import '../core/utils/app_strings.dart';
import '../data/models/players_model.dart';
import '../data/repositories/players_repository.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  PlayersRepository playersRepository;
  AppCubit({required this.playersRepository}) : super(AppInitial());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  String errorMessage = "";
  List<PlayersModel> players = [];

  Future<void> getAllPlayers() async {
    emit(LoadingAddPlayersState());
    Either<Failures, List<PlayersModel>> result =
        await playersRepository.fetchAllPlayers();
    result.fold((failure) {
      errorMessage = errorFailureMessage(failure);
      emit(ErrorAddPlayersState());
    }, (data) {
      players = data;
      emit(SuccessGetPlayersState());
    });
  }

  List<PlayersModel> playerAdded = [
    PlayersModel(AppConstants.idTestAccount, AppStrings.test,
        AppStrings.account, AppStrings.ahmed, AppConstants.moSalahImg)
  ];

  addPlayer(player) {
    playerAdded.add(player);
    emit(AddPlayerState());
  }

  removePlayer(value) {
    playerAdded.remove(value);
    emit(RemovePlayerState());
  }

  var searchController = TextEditingController();

  bool isSearch = false;
  List<PlayersModel> resultSearch = [];
  searchPlayer(String searchText) {
    resultSearch = players
        .where((player) =>
            player.firstName!.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    isSearch = true;
    emit(SearchPlayerState());
  }
}
