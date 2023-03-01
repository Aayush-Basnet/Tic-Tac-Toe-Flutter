import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
// To add Icon Image
  var cross = Icon(
    Icons.cancel_rounded,
    size: 70,
    color: Colors.blueGrey,
  );
  var circle = Icon(
    Icons.circle,
    size: 70,
    color: Color.fromARGB(255, 60, 138, 211),
  );
  var edit = Icon(
    Icons.check_box_outline_blank,
    size: 50,
  );
  bool isCross = true;
  late String message;
  late List<String> gameState;

  //Initialize Box with empty value

  @override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message = " ";
    super.initState();
  }

  // To Play Game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
        checkWin();
      });
    }
  }

//Reset Game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = " ";
    });
  }

// To get Icon Image
  getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;

      case ('cross'):
        return cross;
        break;

      case ('circle'):
        return circle;
        break;
    }
  }

// To Check for winning
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = this.gameState[0] + 'Win';
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = this.gameState[3] + 'Win';
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = this.gameState[6] + 'Win';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = this.gameState[0] + 'Win';
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = this.gameState[1] + 'Win';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = this.gameState[2] + 'Win';
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = this.gameState[0] + 'Win';
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = this.gameState[2] + 'Win';
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: this.gameState.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,
                      child: MaterialButton(
                        onPressed: () {
                          this.playGame(i);
                        },
                        child: getIcon(this.gameState[i]),
                      ),
                    )),
          ),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: MaterialButton(
              color: Colors.blue[800],
              onPressed: () {
                resetGame();
              },
              child: Text(
                "Reset Game",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Developed By Aayush Basnet",
            style: TextStyle(
                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
