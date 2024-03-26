import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routers/app_routes.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:flutter_crud/views/userform.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => UsersProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const UserList(),
            routes: {
              AppRoutes.userform: (_) => const UserForm()
            },
            ));
  }
}
