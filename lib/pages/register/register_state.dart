import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

enum RegisterStatus { initial, loading, register, error }

class RegisterState extends Equatable {
  final RegisterStatus status;
  final String? errorMessage;
  final String name;
  final String email;
  final String password;
  const RegisterState({
    required this.status,
    this.errorMessage,
    required this.name,
    required this.email,
    required this.password,
  });

  const RegisterState.initial()
      : status = RegisterStatus.initial,
        name = '',
        email = '',
        password = '',
        errorMessage = '';

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        name,
        email,
        password,
      ];

  RegisterState copyWith({
    RegisterStatus? status,
    ValueGetter<String?>? errorMessage,
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterState(
      status: status ?? this.status,
      errorMessage: errorMessage?.call() ?? this.errorMessage,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
