import 'package:flutter/material.dart';

// custom widgets
import './home.dart';
import './result.dart';
import './quiz.dart';


void main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var start = false;
  var finish = false;
  var index = 0;
  var score = 0;

  var questions = [
    {
      "question": "Which river is considered the holiest river in India?",
      "choices": ["Yamuna", "Ganges", "Brahmaputra", "Godavari"],
      "answer": 2
    },
    {
      "question": "Who was the first Prime Minister of India?",
      "choices": ["Indira Gandhi", "Jawaharlal Nehru", "Sardar Patel", "Rajiv Gandhi"],
      "answer": 2
    },
    {
      "question": "Which city is known as the 'Pink City'?",
      "choices": ["Jaipur", "Jodhpur", "Udaipur", "Ajmer"],
      "answer": 1
    },
    {
      "question": "What is the currency of India?",
      "choices": ["Rupee", "Rupiah", "Ringgit", "Rand"],
      "answer": 1
    },
    {
      "question": "Who wrote the national anthem of India?",
      "choices": ["Rabindranath Tagore", "Mahatma Gandhi", "Jawaharlal Nehru", "Bankim Chandra Chattopadhyay"],
      "answer": 1
    },
    {
      "question": "Which Indian state is known as the 'Land of Five Rivers'?",
      "choices": ["Punjab", "Haryana", "Uttar Pradesh", "Bihar"],
      "answer": 1
    },
    {
      "question": "Who is known as the 'Father of the Nation' in India?",
      "choices": ["Subhas Chandra Bose", "Jawaharlal Nehru", "Mahatma Gandhi", "Sardar Patel"],
      "answer": 3
    },
    {
      "question": "In which year did India gain independence from British rule?",
      "choices": ["1942", "1947", "1950", "1962"],
      "answer": 2
    },
    {
      "question": "Which Indian festival is known as the 'Festival of Lights'?",
      "choices": ["Holi", "Diwali", "Eid", "Durga Puja"],
      "answer": 2
    },
    {
      "question": "What is the largest state in India by area?",
      "choices": ["Maharashtra", "Uttar Pradesh", "Rajasthan", "Madhya Pradesh"],
      "answer": 3
    }
  ];

  // var questions = readJsonFile("assets/data.json");

  void _answer(bool isCorrect) async {

    setState(() {
      if(isCorrect){
        score++;
      }
      if (index <  questions.length - 1) {
        index++;
      } else {
        finish = true;
      }
    });
  }

  void _start() {
    setState(() {
      start = true;
    });
  }

  void _restart() {
    setState(() {
      index = 0;
      score = 0;
      finish = false;
      start = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(52, 209, 191, 1),
            title: Text('QuizApp')),
        body: finish ? (
          Result(score: score, callBackHandler: _restart,)
        ) : (
            start
                ? (Center(
              child: Column(children: [
                Quiz(
                    question: questions [index]['question'] as String,
                    choice: questions[index]['choices'] as List<String>,
                    answer: questions[index]['answer'] as int,
                    callbackHandler: (bool i) => _answer(i)),
              ]),
            ))
                : (Home(
              callBackHandler: _start,
            ))
        ),
      ),
    );
  }
}
// background - 34D1BF
// foreground - 070707
