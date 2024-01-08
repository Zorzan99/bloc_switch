import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                //  validator: Validatorless.email('Digite um e-mail válido'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                obscureText: true,
                //   validator: Validatorless.min(
                //       6, 'A senha deve ter no mínimo 6 caracteres'),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // final valid = _formKey.currentState?.validate() ?? false;
                  // if (valid) {
                  //   _emailController;
                  //   _passwordController;
                  // }
                  Navigator.of(context).pushNamed('/home');
                },
                child: const Text('Entrar'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Criar conta'))
            ],
          ),
        ),
      ),
    );
  }
}
