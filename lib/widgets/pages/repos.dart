// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:layout/API/github_api.dart';

class Repo extends StatelessWidget {
  // static Future<List<dynamic>> users = GitHubApi.getRandomUsers()
  Repo(
      {@required this.userName,
      @required this.repoName,
      @required this.watchersCount,
      @required this.forksCount});
  final userName;
  final repoName;
  final watchersCount;
  final forksCount;

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
            child: ListView.builder(itemBuilder: (BuildContext ctx, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                child: RepoBody(
                  repoName: repoName,
                  watchersCount: watchersCount,
                  forksCount: forksCount,
                ),
              );
            }),
          )),
    );
  }
}

class RepoBody extends StatelessWidget {
  @override
  RepoBody(
      {@required this.repoName,
      @required this.watchersCount,
      @required this.forksCount});
  final repoName;
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
