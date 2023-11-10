import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_ui/questionBank.dart';

import 'package:quiz_app_ui/theme/style.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


// object created for the class QuestionBank
QuestionBank questionBank = QuestionBank();

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

  //function to check whether correct answers and user selected answers are equal
  void checkAnswer(bool userSelectedAnswer) {
    bool correctAnswer = questionBank.getAnswerText();

    setState(() {
      // condition to check the quiz is finished or not 
      if (questionBank.isFinished() == true) {
        Alert(
          context: context,
          title: 'You are successfully completed the quiz',
        ).show();

        questionBank.reset();
      } else {
        if (userSelectedAnswer == correctAnswer) {
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
        questionBank.nextQuestion();
      }
    });
  }
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
          ),
        ),
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),

            //to display questions
            child: Container(
              child: Text(
                questionBank.getQuestionText(),
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
                  // button for true
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    checkAnswer(true);
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
                  // button for false
              child: Container(
                height: 80,
                width: 400,
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GestureDetector(
                  onTap: () {
                    checkAnswer(false);
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
