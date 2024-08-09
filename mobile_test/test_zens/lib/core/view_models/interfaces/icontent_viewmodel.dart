import 'package:flutter/material.dart';
import 'package:test_zens/core/ui_model/joke_ui_model.dart';

abstract class IContentViewModel implements ChangeNotifier {
  Future<void> init();
  JokeUIModel? get jokeToDisplay;
  Future<void> onLike(bool liked);
}
