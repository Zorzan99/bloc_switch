import 'package:bloc_switch/core/custom_snackbar/custom_snackbar.dart';
import 'package:bloc_switch/core/loader/loader.dart';
import 'package:bloc_switch/pages/register/register_cubit.dart';
import 'package:bloc_switch/pages/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with Loader {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        switch (state.status) {
          case RegisterStatus.initial:
          case RegisterStatus.loading:
            showLoader();
          case RegisterStatus.register:
            hideLoader();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
            CustomSnackbar.showSnackbar(context, "Conta criada com sucesso");
          case RegisterStatus.error:
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Register'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: Validatorless.required('Digite o nome'),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: Validatorless.email('Digite um e-mail válido'),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    validator: Validatorless.min(
                        6, 'A senha deve ter no mínimo 6 caracteres'),
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      final valid = _formKey.currentState?.validate() ?? false;
                      if (valid) {
                        context.read<RegisterCubit>().register(
                            _emailController.text,
                            _passwordController.text,
                            _nameController.text);
                      }
                    },
                    child: const Text('Registrar'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
