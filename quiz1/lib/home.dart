import 'package:flutter/material.dart';

// custom widgets
import 'components/button.dart';

class Home extends StatelessWidget {
  final VoidCallback? callBackHandler;

  Home({required this.callBackHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: Center(
          child: Column(children: [
            Image.asset(
              'assets/images/ideas.png',
              height: 120,
              width: 120,
            ),
            SizedBox(height: 20),
            Text('QuizApp'),
            Button(
              text: 'Start',
              callBackHandler: callBackHandler,
            ),
            SizedBox(height: 200),
            Text('This is Simple quiz app by vivek')
          ]),
        ));
  }
}
