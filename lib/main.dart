import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "Введите ПИН-код для входа в приложение";
  String pincode = '';
  String password = "4957";
  int maxLength = 4;
  final Map<String, Color> colors = {
    "grey": Color(0xFFD6D6D6),
    "blue": Color(0xFF1CACCC),
    "red": Color(0xFFFC3F1D),
    "green": Color.fromARGB(255, 61, 199, 65)
  };
  bool correct = false;
  void onPressed(String number) {
    setState(() {
      if (number == 'del') {
        pincode = pincode.substring(0, pincode.length - 1);
        if (text != "Введите ПИН-код для входа в приложение")
          setState(() {
            text = "Введите ПИН-код для входа в приложение";
          });
      } else if (pincode.length < maxLength) pincode += number;
      if (pincode.length == maxLength) {
        correct = pincode == password;
        setState(() {
          text = correct ? "Правильный ПИН-код" : "ПИН-коды не совпали";
        });
        if (!correct)
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              pincode = "";
              text = "Введите ПИН-код для входа в приложение";
            });
          });
      }
    });
  }

  Color? getColor(int length) {
    print(pincode);
    if (pincode.length == maxLength)
      return correct ? colors["green"] : colors["red"];
    return pincode.length - length <= 0 ? colors["grey"] : colors["blue"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // FloatingActionButton(
                //   onPressed: onPressed,
                //   backgroundColor: Colors.white,
                // ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 17,
                    textBaseline: TextBaseline.alphabetic,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                    width: 90,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            maxLength,
                            (int index) => Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: getColor(index) ?? Color(0xCCD6D6D6),
                                shape: BoxShape.circle,
                              ),
                              // ShapeDecoration(
                              //   shape: CircleBorder(),
                              //   color: Color(0xD6D6D6),
                              // ),
                            ),
                          )),
                    )),
                SizedBox(
                  height: 387,
                  width: 290,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CustomButton(
                              text: "1", onPressed: () => onPressed("1")),
                          CustomButton(
                              text: "2", onPressed: () => onPressed("2")),
                          CustomButton(
                              text: "3", onPressed: () => onPressed("3")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CustomButton(
                              text: "4", onPressed: () => onPressed("4")),
                          CustomButton(
                              text: "5", onPressed: () => onPressed("5")),
                          CustomButton(
                              text: "6", onPressed: () => onPressed("6")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CustomButton(
                              text: "7", onPressed: () => onPressed("7")),
                          CustomButton(
                              text: "8", onPressed: () => onPressed("8")),
                          CustomButton(
                              text: "9", onPressed: () => onPressed("9")),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            height: 78,
                            width: 80,
                          ),
                          CustomButton(
                              text: "0", onPressed: () => onPressed("0")),
                          pincode.length == 0
                              ? SizedBox(
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1CACCC),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      child: Text(
                        "Продолжить",
                        style: GoogleFonts.montserrat(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final Widget? centerChild;
  const CustomButton(
      {this.text, required this.onPressed, this.buttonStyle, this.centerChild})
      : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 78,
      child: ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.zero,
              ),
          child: Center(
            child: centerChild ??
                Text(
                  text ?? '',
                  style: GoogleFonts.montserrat(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(7, 7, 7, 1)),
                  // const TextStyle(
                  //   fontSize: 29,
                  //   fontWeight: FontWeight.bold,
                  //   fontFamily:  ,
                  // ),
                  textAlign: TextAlign.start,
                ),
          )),
    );
  }
}

class IconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;

  const IconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
