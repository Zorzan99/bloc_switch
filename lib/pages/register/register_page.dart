import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  if (_formKey.currentState!.validate()) {
                    // Faça alguma coisa com os dados (por exemplo, registro de usuário)
                    // Aqui você pode acessar os valores dos campos com _nameController.text, _emailController.text e _passwordController.text
                    print('Nome: ${_nameController.text}');
                    print('E-mail: ${_emailController.text}');
                    print('Senha: ${_passwordController.text}');
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
