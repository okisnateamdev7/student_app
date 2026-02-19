import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_textfield.dart';

class CreateNewPasswordPage extends StatelessWidget {
  const CreateNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Create New Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              const CustomTextField(hint: "New Password", isPassword: true),
              const SizedBox(height: 20),

              const CustomTextField(hint: "Confirm Password", isPassword: true),
              const SizedBox(height: 20),

              CustomButton(text: "Reset Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
