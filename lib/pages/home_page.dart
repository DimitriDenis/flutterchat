import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:superchat/constants.dart';
import 'package:superchat/pages/sign_in_page.dart';
import 'package:superchat/widgets/stream_listener.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StreamListener<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      listener: (user) {
        if (user == null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const SignInPage()),
              (route) => false);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(kAppTitle),
            backgroundColor: theme.colorScheme.primary,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
          /*body: const Center(
          child: Text('Welcome to SuperChat!'),
        ),*/
          body: Column(
            children: [
              Container(
                color: Colors.red,
                height: 250,
              ),
              const Spacer(flex: 1),
              Container(
                color: Colors.orange,
                height: 50,
              ),
              const Spacer(flex: 1),
            ],
          )),
    );
  }
}
