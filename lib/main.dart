// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '';
  String enemyHand = '';
  String result = '';

  void setMyHand(String setHand) {
    myHand = setHand;
  }

  String enemyHandNumberToJanken(int i) {
    switch (i) {
      case 0:
        return '👊';
      case 1:
        return '✌️';
      default:
        return '✋';
    }
  }

  void setEnemyHand() {
    final handNumber = Random().nextInt(3);
    final newHand = enemyHandNumberToJanken(handNumber);
    enemyHand = newHand;
  }

  void jankenResult() {
    if (myHand == enemyHand) {
      result = '引き分け！';
    } else if (myHand == '👊' && enemyHand == '✌️' ||
        myHand == '✋' && enemyHand == '👊' ||
        myHand == '✌️' && enemyHand == '✋') {
      result = '勝ち！';
    } else {
      result = '負け！';
    }
  }

//UIコード
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ジャンケン'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('相手'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                enemyHand,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Text(
              result,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
            const Text('あなた'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                myHand,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      setMyHand('👊');
                      setEnemyHand();
                      jankenResult();
                    });
                  },
                  child: const MyHand(
                    myHand: '👊',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      setMyHand('✌️');
                      setEnemyHand();
                      jankenResult();
                    });
                  },
                  child: const MyHand(
                    myHand: '✌️',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      setMyHand('✋');
                      setEnemyHand();
                      jankenResult();
                    });
                  },
                  child: const MyHand(
                    myHand: '🖐️',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyHand extends StatelessWidget {
  final String myHand;
  const MyHand({
    Key? key,
    required this.myHand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        myHand,
        style: const TextStyle(
          color: Colors.deepOrange,
          fontSize: 30,
        ),
      ),
    );
  }
}
