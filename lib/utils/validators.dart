import 'dart:async';

mixin Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('El formato del email no es correcto.');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password);
    } else {
      sink.addError(
          'La longitud debe ser mayor o igual a 8 carateres por favor.');
    }
  });

  final validarOrigin = StreamTransformer<String, String>.fromHandlers(
      handleData: (origin, sink) {
    if (origin.isNotEmpty) {
      sink.add(origin);
    } else {
      sink.addError('Más de 6 carateres por favor.');
    }
  });

  final validarDestination = StreamTransformer<String, String>.fromHandlers(
      handleData: (destination, sink) {
    if (destination.isNotEmpty) {
      sink.add(destination);
    } else {
      sink.addError('Más de 6 carateres por favor.');
    }
  });
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    if (nombre.isNotEmpty) {
      sink.add(nombre);
    } else {
      sink.addError('Este campo es obligatori por favor, llénelo.');
    }
  });
  final validarNumTarjeta = StreamTransformer<String, String>.fromHandlers(
      handleData: (numTarjeta, sink) {
    if (numTarjeta.isNotEmpty) {
      sink.add(numTarjeta);
    } else {
      sink.addError('Este campo es obligatori por favor, llénelo.');
    }
  });
  final validarExpTarjeta = StreamTransformer<String, String>.fromHandlers(
      handleData: (expTarjeta, sink) {
    if (expTarjeta.isNotEmpty) {
      sink.add(expTarjeta);
    } else {
      sink.addError('Más de 6 carateres por favor.');
    }
  });
  final validarCodigo = StreamTransformer<String, String>.fromHandlers(
      handleData: (codigo, sink) {
    if (codigo.isNotEmpty) {
      sink.add(codigo);
    } else {
      sink.addError('Más de 6 carateres por favor.');
    }
  });
}
