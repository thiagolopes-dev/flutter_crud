import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void loadFormData(User user) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
  }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
    loadFormData(user);
  }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Usuário'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_form.currentState != null) {
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();

                  Provider.of<UsersProvider>(context, listen: false).put(User(
                    // Se _formData['id'] for nulo, define uma string vazia como valor padrão
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    email: _formData['email'] ?? '',
                    avatarUrl: _formData['avatarUrl'] ?? '',
                  ));
                  Navigator.of(context).pop();
                }
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome inválido';
                  }
                  if (value.trim().length < 3) {
                    return 'Nome mínimo 3 caracteres';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              )
            ],
          ),
        ),
      ),
    );
  }
}
