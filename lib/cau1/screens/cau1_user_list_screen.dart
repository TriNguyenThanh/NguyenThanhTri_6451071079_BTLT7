import 'package:flutter/material.dart';

import '../controllers/cau1_user_controller.dart';
import '../data/models/cau1_user_model.dart';

class Cau1UserListScreen extends StatefulWidget {
  const Cau1UserListScreen({super.key});

  @override
  State<Cau1UserListScreen> createState() => _Cau1UserListScreenState();
}

class _Cau1UserListScreenState extends State<Cau1UserListScreen> {
  final Cau1UserController _controller = Cau1UserController();
  late Future<List<Cau1UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _controller.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cau 1 - User List')),
      body: FutureBuilder<List<Cau1UserModel>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final users = snapshot.data ?? [];
          if (users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(child: Text(user.id.toString())),
                title: Text(user.name),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}
