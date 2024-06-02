part of 'mode_bloc.dart';

sealed class ModeEvent {}

class NormalModeEvent extends ModeEvent {}

class BookingModeEvent extends ModeEvent {}
