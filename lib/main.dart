import 'package:destini_challenge_starting/node.dart';
import 'package:destini_challenge_starting/story.dart';
import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

MaterialStateProperty<Color> getColor(Color color) {
  return MaterialStateProperty.all(color);
}

class _StoryPageState extends State<StoryPage> {
  int storyNumber = 0;

  @override
  Widget build(BuildContext context) {
    List<BinaryTreeNode> binaryTree = [];
    for (var i = 0; i < 10; i++) {
      binaryTree.add(BinaryTreeNode("test$i", i + 1, i + 2));
    }

    for (var i = 0; i < 10; i++) {
      print(
          "data: ${binaryTree[i].data}, dest1: ${binaryTree[i].dest1}, dest2: ${binaryTree[i].dest2}");
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(storyNumber),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    setState(() {
                      storyNumber = storyBrain.getChoice1Goal(storyNumber);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.red),
                  ),
                  child: Text(
                    storyBrain.getChoice1(storyNumber),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 2 made by user.
                    setState(() {
                      storyNumber = storyBrain.getChoice2Goal(storyNumber);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.blue),
                  ),
                  child: Text(
                    storyBrain.getChoice2(storyNumber),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.

//TODO: Step 29 - Run the app and test it against the Story Outline to make sure you've completed all the steps. The code for the completed app can be found here: https://github.com/londonappbrewery/destini-challenge-completed/
