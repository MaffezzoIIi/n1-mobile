import 'package:flutter/material.dart';
import 'package:n1mobile/pages/sign_up.dart';
import 'package:n1mobile/pages/user_password.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.money,
              size: 100,
            ),
            const Text(
              'B8B BANK',
              textScaleFactor: 3,
            ),
            const Text(
              'MOBILE APP',
              style: TextStyle(fontSize: 25),
            ),

            const SizedBox(height: 50),

            SizedBox(
              width: 300,
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Username or Email'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true, // Hide the password
              ),
            ),
            const SizedBox(height: 20), // Spacer between inputs

            // Submit button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        const UserPassword(), // Replace SignUpScreen with your sign-up screen
                  ),
                );
              },
              child: const Text('Submit'),
            ),
            // Submit button
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Novo no aplicativo ?'),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-up screen here
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const SignUpScreen(), // Replace SignUpScreen with your sign-up screen
                    ));
                  },
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
