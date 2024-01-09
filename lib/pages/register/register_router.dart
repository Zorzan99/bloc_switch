import 'package:bloc_switch/pages/register/register_cubit.dart';
import 'package:bloc_switch/pages/register/register_page.dart';
import 'package:bloc_switch/repositories/register/register_repository.dart';
import 'package:bloc_switch/repositories/register/register_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterRouter {
  const RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<RegisterRepository>(
            create: (context) => RegisterRepositoryImpl(
              firebaseAuth: context.read(),
            ),
          ),
          Provider(
            create: (context) => RegisterCubit(context.read()),
          )
        ],
        child: const RegisterPage(),
      );
}
