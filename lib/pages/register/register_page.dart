import 'package:flutter/material.dart';
import 'package:model_test/view_models/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Ol"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller:
                        context.read<RegisterViewModel>().usernameController,
                    decoration: const InputDecoration(
                        labelText: "İsim Soyisim",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller:
                        context.read<RegisterViewModel>().emailController,
                    decoration: const InputDecoration(
                        labelText: "E-mail ",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller:
                        context.read<RegisterViewModel>().passwordController,
                    decoration: const InputDecoration(
                        labelText: "Şifre ",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller:
                        context.read<RegisterViewModel>().passwordController2,
                    decoration: const InputDecoration(
                        labelText: "Şifre (tekrar) ",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<RegisterViewModel>().register();
                      },
                      child: const Text(
                        "Kayıt Ol",
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
