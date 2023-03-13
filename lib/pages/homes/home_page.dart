import 'package:flutter/material.dart';
import 'package:model_test/pages/profile/profile_page.dart';
import 'package:model_test/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<ProfileViewModel>().getUsers();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text("Users"),
        Expanded(
            child: ListView.builder(
          itemCount: context.watch<ProfileViewModel>().users.length,
          itemBuilder: (context, index) {
            User user = context.watch<ProfileViewModel>().users[index];
            return GestureDetector(
              onTap: () async {
                await context.read<ProfileViewModel>().getUser(user.id!);
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  shadowColor: Colors.green,
                  elevation: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    user.avatar!,
                                    width: MediaQuery.of(context).size.width *
                                        0.25,
                                  )),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: [
                                  Text(
                                    user.firstName! + " " + user.lastName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    user.email!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            );
          },
        )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 1; i <= context.watch<ProfileViewModel>().totalPage; i++)
            context.watch<ProfileViewModel>().page == i
                ? Text(i.toString())
                : TextButton(
                    onPressed: () {
                      context.read<ProfileViewModel>().setPage(i);
                    },
                    child: Text(i.toString()))
        ])
      ]),
    );
  }
}
