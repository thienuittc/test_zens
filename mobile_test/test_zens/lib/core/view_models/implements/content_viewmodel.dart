import 'package:flutter/material.dart';
import 'package:test_zens/core/ui_model/joke_ui_model.dart';

import '../interfaces/icontent_viewmodel.dart';

class ContentViewModel with ChangeNotifier implements IContentViewModel {
  final List<JokeUIModel> _jokes = JokeUIModel.jokes;
  List<JokeUIModel> _jokesUnread = [];

  JokeUIModel? _jokeToDisplay;
  @override
  JokeUIModel? get jokeToDisplay => _jokeToDisplay;

  @override
  Future<void> init() async {
    List<JokeUIModel> savedJokes = await getAllJokes();
    Set<int> savedJokeIds = savedJokes.map((joke) => joke.id).toSet();
    _jokesUnread =
        _jokes.where((joke) => !savedJokeIds.contains(joke.id)).toList();
    getContent();
  }

  void getContent() {
    _jokeToDisplay = _jokesUnread.firstOrNull;
    notifyListeners();
  }

  @override
  Future<void> onLike(bool liked) async {
    _jokeToDisplay!.liked = liked;
    _jokeToDisplay!.isRead = true;
    await saveJokeStatus(_jokeToDisplay!);
    _jokesUnread.removeWhere((joke) => joke.id == _jokeToDisplay!.id);
    getContent();
  }
}
