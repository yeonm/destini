import 'package:flutter/material.dart';

class Story {
  String storyTitle;
  String choice1;
  String choice2;

  int choice1Goal;
  int choice2Goal;

  Story({
    this.storyTitle,
    this.choice1,
    this.choice2,
    this.choice1Goal,
    this.choice2Goal,
  });
}
