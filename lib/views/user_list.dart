import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routers/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userform
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTitle(users.byIndex(i)),
      ),
    );
  }
}
