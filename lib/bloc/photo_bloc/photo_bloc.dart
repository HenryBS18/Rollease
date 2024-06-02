import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<AddPhotoEvent>((event, emit) {
      emit(PhotoResult(event.imagePath));
    });

    on<ResetPhotoEvent>((event, emit) {
      emit(PhotoInitial());
    });
  }
}
