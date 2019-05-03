import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Item{
  final String name;
  final String author;
  final String description;
  final String link;
  final int number;

  Item(this.name, this.author, this.description, this.link, this.number);
}

class Question{
  String image;
  String answer;
  Question(this.image, this.answer);
}

  Future<List<Item>> getData(String linkApi) async {
    var data = await http.get(linkApi);
    var jsonData = json.decode(data.body);

    List<Item> items = [];

    for (var u in jsonData){
      Item user = Item(u["name"], u["author"], u["description"],u["link"],u["number"]);
      items.add(user);
    }
    print('linkApi:  $linkApi');
    print(items.length);

    return items;
  }


  Future<List<Question>> getDataQuiz(String linkApiQues) async {
    var data = await http.get(linkApiQues);
    var jsonData = json.decode(data.body);

    List<Question> questions = [];

    for (var u in jsonData){
      Question question = Question(u["image"], u["answer"]);
      questions.add(question);
    }
    print('linkApiQ: $linkApiQues');
    print(questions.length);

    return questions;
  }