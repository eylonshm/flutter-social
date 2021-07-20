import 'package:flutter/material.dart';
import 'package:layout/widgets/pages/repos.dart';
import 'orgs.dart';
import 'userProfile.dart';

class User extends StatelessWidget {
  @override
  User({@required this.userName, @required this.avatarUrl});
  final userName;
  final avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(width: 500),
            SizedBox(height: 10),
            Text(
              '$userName',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                '$avatarUrl',
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
            SizedBox(
              height: 5,
              width: 120,
            ),
            TextButton(
              child: const Text('User Profile'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return UserProfile(userId: userName);
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
