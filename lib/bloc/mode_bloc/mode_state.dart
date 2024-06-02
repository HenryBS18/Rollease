part of 'mode_bloc.dart';

sealed class ModeState {}

final class ModeInitial extends ModeState {}

final class NormalMode extends ModeState {}

final class BookingMode extends ModeState {}
