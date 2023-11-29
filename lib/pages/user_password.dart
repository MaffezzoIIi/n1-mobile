import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:n1mobile/pages/main_page.dart';

class UserPassword extends StatefulWidget {
  const UserPassword({super.key});

  @override
  UserPasswordState createState() => UserPasswordState();
}

class UserPasswordState extends State<UserPassword> {
  final TextEditingController _passwordController = TextEditingController();
  List<String> enteredNumbers = [];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void addNumber(String number) {
    if (enteredNumbers.length < 6) {
      setState(() {
        enteredNumbers.add(number);
      });
    }
  }

  void removeNumber() {
    if (enteredNumbers.isNotEmpty) {
      setState(() {
        enteredNumbers.removeLast();
      });
    }
  }

  Future<void> checkPassword() async {
    String password = enteredNumbers.join();
    if (password.length == 6) {
      try {
        DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
            .collection('users')
            .doc('4F5khvA9vsL2Aj2AGpTX')
            .get();

        if (snapshot.exists) {
          String storedPassword = snapshot.get('password');
          if (password == storedPassword) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Senha incorreta. Por favor, tente novamente.'),
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Usuário não encontrado. Por favor, tente novamente.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Row buildDigitsRow(List<String> numbers) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: numbers.map((number) {
          return Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange,
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        }).toList(),
      );
    }

    GestureDetector buildNumberButton(String number) {
      return GestureDetector(
        onTap: () {
          addNumber(number);
        },
        child: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 13),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      );
    }

    if (enteredNumbers.length == 6) {
      checkPassword();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.orange,
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Thomas Maffezzolli',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Por favor, insira sua senha para continuar',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // add six circles to represent the password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [buildDigitsRow(enteredNumbers)],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildNumberButton('1'),
                          buildNumberButton('2'),
                          buildNumberButton('3'),
                        ]),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildNumberButton('4'),
                        buildNumberButton('5'),
                        buildNumberButton('6'),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildNumberButton('7'),
                        buildNumberButton('8'),
                        buildNumberButton('9'),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(left: 13),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            addNumber('0');
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(left: 13),
                            child: const Center(
                              child: Text(
                                '0',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            removeNumber();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(right: 13),
                            child: const Center(
                              child: Icon(
                                Icons.backspace,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Esqueceu sua senha?',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
