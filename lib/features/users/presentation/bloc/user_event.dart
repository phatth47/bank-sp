part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class GetUserListEvent extends UserEvent {
  const GetUserListEvent();
}
