import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> s1 = [];
  Texts ts = Texts();

  void addIcons(bool ans,bool alert) {
    setState(() {
      if (ts.getQuestionAnswer() == ans) {
        s1.add(const Icon(
          Icons.check,
          color: Colors.white,
        ));
      } else {
        s1.add(const Icon(
          Icons.close,
          color: Colors.white,
        ));
      }
      if(alert==true) {
        alert = false;
        s1.clear();
        _showAlert(context);
      }
      else {
        ts.nextQuestion();
      }
    });
  }
  bool alert=false;
  void _showAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Warning",
      desc: "You have reached the end of the quiz",
      buttons: [
        DialogButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(padding: EdgeInsets.only(top: 350)),
          Center(
            child: Text(
              ts.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 27,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          TextButton(
            onPressed: () {
              alert=ts.isFull();
              print('alert is =' ) ;
              print (alert);
              addIcons(true,alert);
            },
            child: Container(
              height: 70.0,
              width: double.infinity,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              alert=ts.isFull();
              addIcons(false,alert);
              },
            child: Container(
              height: 70.0,
              width: double.infinity,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: s1,
          ),
        ],
      ),
    );
  }
}
