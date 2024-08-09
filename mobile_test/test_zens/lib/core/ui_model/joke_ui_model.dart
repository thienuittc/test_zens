import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class JokeUIModel {
  int id;
  String? content;
  bool isRead;
  bool? liked;

  JokeUIModel({
    required this.id,
    this.content,
    this.isRead = false,
    this.liked,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'isRead': isRead,
        'liked': liked,
      };

  factory JokeUIModel.fromJson(Map<String, dynamic> json) => JokeUIModel(
        id: json['id'],
        isRead: json['isRead'],
        liked: json['liked'],
      );

  static final List<JokeUIModel> jokes = [
    JokeUIModel(
        id: 1,
        content:
            '''A child asked his father, "How were people born?" So his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on."

The child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now."

The child ran back to his father and said, "You lied to me!" His father replied, "No, your mom was talking about her side of the family."'''),
    JokeUIModel(
        id: 2,
        content:
            '''Teacher: "Kids,what does the chicken give you?" Student: "Meat!" Teacher: "Very good! Now what does the pig give you?" Student: "Bacon!" Teacher: "Great! And what does the fat cow give you?" Student: "Homework!"'''),
    JokeUIModel(
        id: 3,
        content:
            '''The teacher asked Jimmy, "Why is your cat at school today Jimmy?" Jimmy replied crying, "Because I heard my daddy tell my mommy, 'I am going to eat that pussy once Jimmy leaves for school today!'"'''),
    JokeUIModel(
        id: 4,
        content:
            '''A housewife, an accountant and a lawyer were asked "How much is 2+2?" The housewife replies: "Four!". The accountant says: "I think it's either 3 or 4. Let me run those figures through my spreadsheet one more time." The lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"'''),
  ];
}

Future<void> saveJokeStatus(JokeUIModel joke) async {
  final prefs = await SharedPreferences.getInstance();
  final jokeStatus = prefs.getString('jokeStatus') ?? '{}';
  Map<String, dynamic> jokeMap = jsonDecode(jokeStatus);
  jokeMap[joke.id.toString()] = joke.toJson();
  await prefs.setString('jokeStatus', jsonEncode(jokeMap));
}

Future<List<JokeUIModel>> getAllJokes() async {
  final prefs = await SharedPreferences.getInstance();
  final jokeStatus = prefs.getString('jokeStatus') ?? '{}';
  Map<String, dynamic> jokeMap = jsonDecode(jokeStatus);
  return jokeMap.values.map((json) => JokeUIModel.fromJson(json)).toList();
}
