part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState(this.allUsers);

  final List<User> allUsers;

  @override
  List<Object> get props => [allUsers];
}

class UserInitial extends UserState {
  UserInitial(super.allUsers);
}

class UserLoading extends UserState {
  UserLoading(super.allUsers);
}

class UserFinish extends UserState {
  UserFinish(super.allUsers);
}

class UserError extends UserState {
  UserError(super.allUsers);
}
