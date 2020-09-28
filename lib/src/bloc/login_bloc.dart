import 'dart:async';
import 'package:infoveapp/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _usrController = BehaviorSubject<String>();
  final _pwdController = BehaviorSubject<String>();

  Stream<bool> get formValidStream =>
      Observable.combineLatest2(usrStream, pwdStream, (e, p) => true);

  //recuperar datos del Stream
  Stream<String> get usrStream => _usrController.stream.transform(validarUsr);
  Stream<String> get pwdStream =>
      _pwdController.stream.transform(validarPassword);

//insertar valores al Stream
  Function(String) get changeUsr => _usrController.sink.add;
  Function(String) get changePwd => _pwdController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get usr => _usrController.value;
  String get pwd => _pwdController.value;

  dispose() {
    _usrController?.close();
    _pwdController?.close();
    // '?'si es nulo no ejecutar el .close
  }
}
