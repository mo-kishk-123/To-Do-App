import 'package:flutter/material.dart';
import 'package:to_do_app/auth/login.dart';
import 'package:to_do_app/auth/register.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = "Auth";

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          bottom: TabBar(
              indicatorPadding: EdgeInsets.only(bottom: 4, left: 40, right: 40),
              // isScrollable: false,
              tabs: [
                Tab(
                  child: Text("Login"),
                ),
                Tab(
                  child: Text("Register"),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            RegisterTab(),
          ],
        ),
      ),
    );
  }
}
