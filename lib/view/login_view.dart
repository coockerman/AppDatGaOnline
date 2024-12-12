import 'package:flutter/material.dart';
import 'package:flutter_app_ban_ga/view/sign_up_view.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Get.to(()=> SignUpView());
          },
            child: Text('login')),
      ),
    );
  }
}
