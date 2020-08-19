import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //TODO: Link Up images
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  bool isCross = true;
  String message;
  List<String> gameState;

  //TODO: initialize the state of box with empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = "";
    });
  }

  //TODO: play game method()
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  //TODO: Reset game method()
  resetGame() {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
      ];
      this.message = "";
    });
  }

  //TODO: get image method()
  AssetImage getImage(String value) {
    switch (value) {
      case "empty":
        return edit;
      case "cross":
        return cross;
      case "circle":
        return circle;
    }
  }

  //TODO: check for win logic
  checkWin() {
    if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[1]) &&
        (gameState[0] == gameState[2])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[3] != 'empty') &&
        (gameState[3] == gameState[4]) &&
        (gameState[3] == gameState[5])) {
      setState(() {
        this.message = '${this.gameState[3]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[6] != 'empty') &&
        (gameState[6] == gameState[7]) &&
        (gameState[6] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[6]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[4]) &&
        (gameState[0] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[4]) &&
        (gameState[2] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[0] != 'empty') &&
        (gameState[0] == gameState[3]) &&
        (gameState[0] == gameState[6])) {
      setState(() {
        this.message = '${this.gameState[0]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[1] != 'empty') &&
        (gameState[1] == gameState[4]) &&
        (gameState[1] == gameState[7])) {
      setState(() {
        this.message = '${this.gameState[1]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if ((gameState[2] != 'empty') &&
        (gameState[2] == gameState[5]) &&
        (gameState[2] == gameState[8])) {
      setState(() {
        this.message = '${this.gameState[2]} wins';
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game draw!";
        Future.delayed(const Duration(milliseconds: 1000), () {
          resetGame();
        });
      });
    }
    return this.message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic tac toe !'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(image: this.getImage(this.gameState[i])),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(10.0),
              child: Text(
                (this.message).toUpperCase(),
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )),
          MaterialButton(
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text(
              "Reset game",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              this.resetGame();
            },
            padding: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
          ),
          Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Naha's codebase", style: TextStyle(fontSize: 18.0)))
        ],
      ),
    );
  }
}
