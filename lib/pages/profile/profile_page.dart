import 'package:flutter/material.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? get user => context.watch<ProfileViewModel>().user!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            shadowColor: Colors.green,
            elevation: 50,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(user!.avatar!)),
                    Text(
                      user!.firstName!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.lastName!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.email!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
