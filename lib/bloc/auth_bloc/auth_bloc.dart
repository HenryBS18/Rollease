import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rollease/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UserInitial()) {
    on<AddUserEvent>((event, emit) {
      emit(UserData(user: event.user));
    });

    on<FetchUserEvent>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? 'kosong';

      final jwt = JWT.verify(token, SecretKey('henry'));
      final payload = jwt.payload;

      int id = payload['id'];
      String name = payload['name'];
      String email = payload['email'];
      DateTime birthdate = DateTime.parse(payload['birthdate']);

      User user = User(
        id: id,
        name: name,
        email: email,
        birthdate: birthdate,
        token: token,
      );

      emit(UserData(user: user));
    });

    on<AddTokenEvent>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", event.token);
    });

    on<RemoveTokenEvent>((event, emit) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove("token");
    });
  }
}
