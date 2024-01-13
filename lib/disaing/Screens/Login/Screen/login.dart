import 'package:minegociomenu/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class Login with Validators {
  static final _emailController = BehaviorSubject<String>();
  static final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  static Function(String) get changeEmail => _emailController.sink.add;
  static Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  static String get email => _emailController.value;
  static String get password => _passwordController.value;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
