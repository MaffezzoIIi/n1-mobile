import 'package:flutter/material.dart';
import 'package:n1mobile/pages/transfer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            SizedBox(width: 8),
            Text('B8B BANK'),
          ],
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Container(
              width: 325,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                const Icon(color: Colors.orange, Icons.person, size: 120),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'THOMAS MAFFEZZOLLI  ',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'BALANCE: ',
                        style: TextStyle(fontSize: 11),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '4,180.20',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: 375,
              height: 505,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              padding: const EdgeInsets.fromLTRB(35, 45, 35, 0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Transfer(),
                                ),
                              );
                            },
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.swap_horiz_rounded,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Transaction',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.payment,
                                color: Colors.white,
                                size: 75,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Payment',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.account_box_rounded,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Account Settings',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.shopify,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Commerce',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.phonelink_ring_rounded,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Cardless',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.wallet_giftcard_rounded,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Bonus',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.shield_outlined,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Insurance',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.description_outlined,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Obligation',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                        Column(children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.qr_code,
                              color: Colors.white,
                              size: 75,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'QR Code',
                            style: TextStyle(fontSize: 11),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
