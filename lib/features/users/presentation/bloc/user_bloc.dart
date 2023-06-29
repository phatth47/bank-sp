import 'dart:async';

import 'package:bank_sp/features/users/data/datasources/user_remote_data_source.dart';
import 'package:bank_sp/features/users/data/repositories/user_repository_impl.dart';
import 'package:bank_sp/features/users/domain/entities/user.dart';
import 'package:bank_sp/features/users/domain/usecases/get_user_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepository = UserRepositoryImpl(
    remoteDataSource: UserRemoteDataSourceImpl(),
  );

  UserBloc() : super(UserInitial()) {
    on<GetUserListEvent>(_mapGetUserListEventToState);
  }

  Future<void> _mapGetUserListEventToState(
    GetUserListEvent event,
    emit,
  ) async {
    try {
      emit(UserLoading());
      final r = await GetUserList(_userRepository).call();
      emit(UserLoaded(users: r));
    } catch (_) {
      emit(const UserError(message: 'Error'));
    }
  }
}
