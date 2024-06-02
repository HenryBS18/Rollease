part of 'photo_bloc.dart';

sealed class PhotoEvent {}

class AddPhotoEvent extends PhotoEvent {
  final String imagePath;

  AddPhotoEvent(this.imagePath);
}

class ResetPhotoEvent extends PhotoEvent {}
