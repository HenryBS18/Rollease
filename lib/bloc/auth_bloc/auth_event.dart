part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AddUserEvent extends AuthEvent {
  final User user;

  AddUserEvent({required this.user});
}

class FetchUserEvent extends AuthEvent {}

class AddTokenEvent extends AuthEvent {
  final String token;

  AddTokenEvent({required this.token});
}

class RemoveTokenEvent extends AuthEvent {}
