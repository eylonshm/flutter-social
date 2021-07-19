import 'package:flutter/material.dart';
import 'package:layout/widgets/pages/repos.dart';
import 'orgs.dart';

class User extends StatelessWidget {
  @override
  User(
      {@required this.userName,
      @required this.followers,
      @required this.following,
      @required this.avatarUrl});
  final userName;
  final followers;
  final following;
  final avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              '$userName',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                '$avatarUrl',
                fit: BoxFit.cover,
                height: 70,
                width: 70,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Text('$following following'),
                SizedBox(height: 4),
                Text('$followers followers')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text('Repositories'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Repo(
                          userName: userName,
                          repoName: 'RepoName',
                          watchersCount: 44,
                          forksCount: 32,
                        );
                      },
                    ));
                  },
                ),
                const SizedBox(width: 8),
                SizedBox(width: 120),
                TextButton(
                  child: const Text('Organizations'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
