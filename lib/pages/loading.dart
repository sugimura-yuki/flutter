import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/pages/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key key}) : super(key: key);
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  /// ファイルを作成する
  Future<bool> get _onLoading async {
    final folder = await getApplicationDocumentsDirectory();
    final path = folder.path;
    final file = File('$path/test.txt');
    file.writeAsString('hogehoge');
    await Future.delayed(Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("masterDataJSON", jsonEncode({}));
    prefs.setInt("timestamp", 0);
    prefs.setInt("dataCount", 0);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _onLoading,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return MyHomePage(title: "my app");
        } else {
          return Scaffold(
            appBar: AppBar(title: Text("更新確認中")),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
