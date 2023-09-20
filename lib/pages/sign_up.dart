import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Crie sua conta',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Seu nome'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Numero da conta'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Numero de telefone'),
                ),
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              SizedBox(
                width: 300, // Adjust the width as needed
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(width: 20),
                  const Text('or'),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
