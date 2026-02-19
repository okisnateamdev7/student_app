import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: isDesktop ? 400 : double.infinity,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              const CustomTextField(hint: "Email"),
              const SizedBox(height: 20),

              const CustomTextField(hint: "Password", isPassword: true),
              const SizedBox(height: 20),

              CustomButton(text: "Sign In", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
