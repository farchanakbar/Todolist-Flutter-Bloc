import 'package:flutter/material.dart';
import 'package:stream_bloc/bloc/export.dart';

class EditUser extends StatelessWidget {
  EditUser(this.user, {super.key});

  final User user;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController ageC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    nameC.text = user.name;
    ageC.text = user.age.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('EDIT USER'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: ageC,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                userBloc.add(
                  EditUserEvent(
                    User(
                      id: user.id,
                      name: nameC.text,
                      age: int.parse(ageC.text),
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text(
                'ADD USER',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
