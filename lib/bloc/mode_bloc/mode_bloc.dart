import 'package:flutter_bloc/flutter_bloc.dart';

part 'mode_event.dart';
part 'mode_state.dart';

class ModeBloc extends Bloc<ModeEvent, ModeState> {
  ModeBloc() : super(ModeInitial()) {
    on<NormalModeEvent>((event, emit) {
      emit(NormalMode());
    });

    on<BookingModeEvent>((event, emit) {
      emit(BookingMode());
    });
  }
}
