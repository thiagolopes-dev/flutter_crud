import 'package:flutter/material.dart';

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
                onPressed: () {},
                icon: const Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
                color: Colors.red,
              )
            ],
          ),
        ));
  }
}
