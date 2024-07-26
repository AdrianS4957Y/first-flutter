import 'dart:async';

import 'package:app/bottom_bar.dart';
import 'package:app/custom_button.dart';
import 'package:app/custom_row.dart';
import 'package:app/globals.dart';
import 'package:app/pincode_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Login to account'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => HomePage();
}

class HomePage extends State<MyHomePage> {
  void onPressed(String number) {
    setState(() {
      if (number == 'del') {
        pinCode = pinCode.substring(0, pinCode.length - 1);
        if (text != "Введите ПИН-код для входа в приложение")
          setState(() {
            text = "Введите ПИН-код для входа в приложение";
          });
      } else if (pinCode.length < maxLength) pinCode += number;
      if (pinCode.length == maxLength) {
        correct = pinCode == password;
        setState(() {
          text = correct ? "Правильный ПИН-код" : "ПИН-коды не совпали";
        });
        if (!correct)
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              pinCode = "";
              text = "Введите ПИН-код для входа в приложение";
            });
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 17,
                      textBaseline: TextBaseline.alphabetic,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  PincodeState(),
                  SizedBox(
                    height: 387,
                    width: 290,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomRow(
                          onPressed: onPressed,
                          fromNumber: 1,
                          toNumber: 3,
                        ),
                        CustomRow(
                          onPressed: onPressed,
                          fromNumber: 4,
                          toNumber: 6,
                        ),
                        CustomRow(
                          onPressed: onPressed,
                          fromNumber: 7,
                          toNumber: 9,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            const SizedBox(
                              height: 78,
                              width: 80,
                            ),
                            CustomButton(
                                text: "0", onPressed: () => onPressed("0")),
                            pinCode.isEmpty
                                ? const SizedBox(
                                    height: 78,
                                    width: 80,
                                  )
                                : IconButton(
                                    icon: Image.asset(
                                      "assets/backspace.png",
                                      scale: 4,
                                    ),
                                    onPressed: () => onPressed("del"),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
