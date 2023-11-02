import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_ui/PAGES/questions.dart';

import 'package:quiz_app_ui/theme/style.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  void Function()? onTap;

  HomePage({
    super.key,
    required this.onTap,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> question = [
  //   " A cheetah is the fastest animal on the planet",
  //   "Pigs roll in the mud because it helps to keep them cool.",
  //   "An octopus has one heart",
  //   "  Sloths take two weeks to digest food.",
  //   "Bats are blind",
  //   "Lions are more likely to hunt down a human than a tiger",
  // ];

  // List<bool> answers = [
  //   false,
  //   true,
  //   false,
  //   true,
  //   false,
  //   false,
  // ];
  List<Questions> quizHome = [
    Questions(q: " A cheetah is the fastest animal on the planet", a: false),
    Questions(
        q: "Pigs roll in the mud because it helps to keep them cool.", a: true),
    Questions(q: "An octopus has one heart", a: false),
    Questions(q: "  Sloths take two weeks to digest food.", a: true),
    Questions(q: "Bats are blind", a: false),
    Questions(
        q: "Lions are more likely to hunt down a human than a tiger", a: false)
  ];
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 270,
        backgroundColor: appbarColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        )),
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(
                quizHome[questionNumber].questionText,
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 25,
                    wordSpacing: 2,
                    letterSpacing: 1,
                    color: textColor),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    bool correctAnswer = quizHome[questionNumber].answerText;
                    setState(() {
                      if (correctAnswer == true) {
                        Alert(
                          context: context,
                          title: "You are right",
                          content: const Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 45,
                          ),
                        ).show();
                      } else {
                        Alert(
                          context: context,
                          title: "You are wrong",
                          content: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 45,
                          ),
                        ).show();
                      }
                      questionNumber++;
                    });
                  },
                  child: Center(
                      child: Text(
                    "True",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                      color: textColor,
                      letterSpacing: 2,
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 12.0, right: 12.0, left: 12.0),
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    bool correctAnswer = quizHome[questionNumber].answerText;
                    setState(() {
                      if (correctAnswer == false) {
                        Alert(
                          context: context,
                          title: "You are right",
                          content: const Icon(
                            Icons.done,
                            color: Colors.green,
                            size: 45,
                          ),
                        ).show();
                      } else {
                        Alert(
                            context: context,
                            title: "You are wrong",
                            content: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 45,
                            )).show();
                      }
                      questionNumber++;
                    });
                  },
                  child: Center(
                      child: Text(
                    "False",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28,
                      color: textColor,
                      letterSpacing: 2,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
