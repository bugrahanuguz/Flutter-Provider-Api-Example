import 'package:flutter/material.dart';
import 'package:model_test/pages/homes/home_page.dart';
import 'package:model_test/view_models/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              controller: context.watch<LoginViewModel>().usernameController,
              decoration: const InputDecoration(
                labelText: "Email Giriniz",
              ),
            ),
            TextField(
              controller: context.watch<LoginViewModel>().passwordController,
              decoration: const InputDecoration(labelText: "Şifre Giriniz"),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool result = await context.read<LoginViewModel>().login();
                  if (result) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Hoşgeldiniz")));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Giriş Yapılamadı")));
                  }
                },
                child: const Text("Giriş Yap"))
          ]),
        ),
      ),
    );
  }
}
