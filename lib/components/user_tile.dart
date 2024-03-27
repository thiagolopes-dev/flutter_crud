import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routers/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserTitle extends StatelessWidget {
  final User user;

  const UserTitle(this.user, {super.key});

  CircleAvatar _buildAvatar(String avatarUrl) {
    return avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(avatarUrl));
  }

  @override
  Widget build(BuildContext context) {
    final avatar = _buildAvatar(user.avatarUrl);
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userform,
                    arguments: user,
                  );
                },
                icon: const Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Excluir Usuário'),
                      content: const Text('Tem certeza?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Não'),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        TextButton(
                          child: const Text('Sim'),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ).then((confirmed) {
                    if (confirmed) {
                      Provider.of<UsersProvider>(context, listen: false)
                          .remove(user);
                    }
                  });
                  // Provider.of<UsersProvider>(context, listen: false)
                  //     .remove(user);
                },
              )
            ],
          ),
        ));
  }
}
