import 'package:flutter/material.dart';
import 'package:stream_bloc/pages/add/add.dart';
import 'package:stream_bloc/pages/edit/edit.dart';
import '../../bloc/export.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('ALL USERS'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userBloc,
        builder: (context, state) {
          if (state.allUsers.isEmpty) {
            return const Center(
              child: Text('Tidak ada data'),
            );
          }

          return ListView.builder(
            itemCount: state.allUsers.length,
            itemBuilder: (context, index) {
              User user = state.allUsers[index];
              return ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditUser(user),
                  ),
                ),
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(user.name),
                subtitle: Text('${user.age}'),
                trailing: IconButton(
                  onPressed: () {
                    userBloc.add(DeleteUserEvent(user));
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUser(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
