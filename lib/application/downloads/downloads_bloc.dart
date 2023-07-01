import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failures/mian_failure.dart';
import '../../domain/downloads/i_downloads_rep.dart';
import '../../domain/downloads/models/downloads.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvet, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_getDownloadsImage>((event, emit) async {
      if (state.downloads != null && state.downloads!.isNotEmpty) {
        emit(DownloadsState(
            isLoading: false,
            downloadsFailureOrSuccessOption: none(),
            downloads: state.downloads));
        return;
      }

      emit(
        state.copyWith(
            isLoading: true, downloadsFailureOrSuccessOption: none()),
      );

      final Either<MinFailure, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImage();
      print(downloadsOption.toString());

      emit(downloadsOption.fold(
          (failure) => state.copyWith(
              isLoading: false,
              downloadsFailureOrSuccessOption: some(left(failure))),
          (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadsFailureOrSuccessOption: some(right(success)))));
    });
  }
}
