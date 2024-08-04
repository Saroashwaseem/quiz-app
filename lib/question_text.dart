import 'question.dart';
class Texts{
  int _check=0;
  List <Questions> _game = [
    Questions('C++ is an object-oriented programming language.',true),
    Questions('The cout object is used for input in C++.',false),
    Questions('C++ supports both single-line and multi-line comments.',true),
  ];
  void nextQuestion()
  {
    if(_check<_game.length-1)
      {
        _check++;
      }
  }
  bool isFull()
  {
    if(_check==_game.length-1)
      {
        reset();
        return true;
      }
    else
      {
        return false;
      }
  }
  void reset()
  {
    _check=0;
  }

  String getQuestionText()
  {
    return _game[_check].question;
  }
  bool getQuestionAnswer()
  {
    return _game[_check].ans;
  }

}