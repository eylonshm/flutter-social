// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:layout/API/github_api.dart';
import 'widgets/pages/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('GitHub Users'),
          ),
          body: Center(
            child: ListView.builder(itemBuilder: (BuildContext ctx, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                child: User(
                  userName: 'eylonshm',
                  avatarUrl: "https://avatars.githubusercontent.com/u/6?v=4",
                  followers: 12,
                  following: 3,
                ),
              );
            }),
          )),
    );
  }
}
