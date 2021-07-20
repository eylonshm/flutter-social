import 'package:flutter/material.dart';
import 'package:layout/widgets/pages/repos.dart';
import 'orgs.dart';
import 'package:layout/API/github_api.dart';
import './reposPage.dart';

class UserProfile extends StatelessWidget {
  late Future<Map<String, dynamic>> userData;
  UserProfile({
    @required this.userId,
  });
  final userId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('$userId\'s Profile'),
          ),
          body: Center(
              child: FutureBuilder<Map<String, dynamic>>(
            future: GitHubApi().getUserInformation(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final userName = snapshot.data?['login'];
                final avatarUrl = snapshot.data?['avatar_url'];
                final following = snapshot.data?['following'];
                final followers = snapshot.data?['followers'];

                if (userName == null) {
                  return Text('User does not exist :(');
                }

                return Center(
                    child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 10),
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
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
                            Text('$followers followers'),
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
                                    return ReposPage(
                                      userName: userName,
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
                ));
              } else {
                return CircularProgressIndicator();
              }
            },
          ))),
    );
  }
}
