import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
        question: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(question: 'A slug\'s blood is green.', answer: true),
    Question(
        question: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".',
        answer: true),
    Question(
        question: 'It is illegal to pee in the Ocean in Portugal.',
        answer: true),
    Question(
        question:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        question:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        question:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        question:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(question: 'Google was originally called "Backrub".', answer: true),
    Question(
        question:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog',
        answer: true),
    Question(
        question:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  void nextQuestion() {
    //the minus 1 will prevent the app from crashing and not going to list 13 because it does not exist
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  getQuestionLength() {
    return _questionBank.length;
  }

  //this will get the question
  getQuestion() {
    return _questionBank[_questionNumber].question;
  }

  //this will get the answer
  getQuestionAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  //this will check if the _questionBank is out of question
  isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //this will assign a 0 to _questionNumber to reset it
  reset() {
    _questionNumber = 0;
  }
}
