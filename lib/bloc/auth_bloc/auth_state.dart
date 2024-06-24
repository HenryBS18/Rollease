part of 'auth_bloc.dart';

sealed class AuthState {}

final class UserInitial extends AuthState {}

final class UserData extends AuthState {
  final User user;

  UserData({required this.user});
}
