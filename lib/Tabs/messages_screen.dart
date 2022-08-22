import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_media/database/testDb.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 60),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              leading: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    NetworkImage(TestDB.avatars[index < 3 ? index : 2]),
              ),
              title: Text(
                'User',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Hi'),
              trailing: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green),
                child: Center(
                    child: Text(
                  '$index',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
