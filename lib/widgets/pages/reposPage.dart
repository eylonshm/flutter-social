// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:layout/API/github_api.dart';

class ReposPage extends StatelessWidget {
  // static Future<List<dynamic>> users = GitHubApi.getRandomUsers()
  ReposPage({
    @required this.userName,
  });
  final userName;

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('$userName\'s Repos'),
        ),
        body: Center(
            child: FutureBuilder<List<Map<String, dynamic>>>(
          future: GitHubApi().getUserRepositories(userName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data?.length == 0) {
                return Text('There\'s nothing to show here');
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10),
                      child: RepoBody(
                        repoName: snapshot.data?[index]['name'],
                        watchersCount: snapshot.data?[index]['watchers_count'],
                        description: snapshot.data?[index]['description'],
                        forksCount: snapshot.data?[index]['forks_count'],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )),
      ),
    );
  }
}

class RepoBody extends StatelessWidget {
  @override
  RepoBody(
      {@required this.repoName,
      @required this.watchersCount,
      @required this.description,
      @required this.forksCount});
  final repoName;
  final description;
  final watchersCount;
  final forksCount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 15),
            Text(
              '$repoName',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
            ),
            Visibility(
              visible: (description != null && description.isNotEmpty),
              child: Container(
                  margin:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                  child: Text(
                    '$description',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  )),
            ),
            SizedBox(height: 10),
            Column(
              children: <Widget>[
                Text('$watchersCount watchers'),
                SizedBox(
                  height: 4,
                  width: 500,
                ),
                Text('$forksCount forks'),
                SizedBox(
                  height: 15,
                  width: 500,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
