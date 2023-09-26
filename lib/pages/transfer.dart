import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _selectedItem;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Transfer'),
        ),
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
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blue,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Da conta:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Para a conta:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Quantidade',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // add a row with two text fields
                  Row(
                    children: [
                      DropdownButton<String>(
                        value: 'Option 1',
                        onChanged: (value) {
                          setState(() {
                            _selectedItem = value;
                          });
                        },
                        items: const [
                          DropdownMenuItem(
                            value: 'Option 1',
                            child: Row(
                              children: [
                                Icon(Icons.monetization_on_sharp),
                                SizedBox(width: 8),
                                Text('Dollar'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Messages',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                  // add a row with send and cancel buttons at the middle of the put the or text
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Send'),
                      ),
                      const Text('or'),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
