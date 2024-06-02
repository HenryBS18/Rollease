part of 'photo_bloc.dart';

sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class PhotoResult extends PhotoState {
  final String imagePath;

  PhotoResult(this.imagePath);
}
