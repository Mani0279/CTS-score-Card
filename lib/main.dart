import 'package:ctsscore/providers/scorecard_provider.dart';
import 'package:ctsscore/screens/scorecard_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScoreCardProvider(),
      child: MaterialApp(
        title: 'CTS Digital Score Card',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScoreCardForm(),
      ),
    );
  }
}