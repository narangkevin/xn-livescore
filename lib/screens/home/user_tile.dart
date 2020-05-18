import 'package:flutter/material.dart';
import 'package:xnlivescore/models/users.dart';

class UserTile extends StatelessWidget {
  
  final Users users;
  UserTile({ this.users });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.lightBlueAccent[400],
          ),
          title: Text(users.name),
            subtitle: Text('Email: ${users.email}'),
        ),
      )
    );
  }
}