import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TicTacToe",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: todo
  //TODO: link up images

  AssetImage cross = AssetImage("images/cross1.png");
  AssetImage circle = AssetImage("images/circle1.png");
  AssetImage edit = AssetImage("images/edit1.png");

  //bool isTrue = true;
  bool isCross = true;
  String message;

  // ignore: todo
  //TODO: initiate state of box with empty

  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // ignore: todo
  //TODO: play game method
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "Cross";
        } else {
          this.gameState[index] = "Circle";
        }
        this.isCross = !this.isCross;
        this.checkWin();
      });
    }
  }

  // ignore: todo
  //TODO:Reset game method
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // ignore: todo
  //TODO: get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;

      case ("Cross"):
        return cross;
        break;

      case ("Circle"):
        return circle;
        break;
    }
  }

  // ignore: todo
  //TODO: check for win method
  checkWin() {
    if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[1]) &&
        (gameState[1] == gameState[2])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if ((gameState[3] != "empty") &&
        (gameState[3] == gameState[4]) &&
        (gameState[4] == gameState[5])) {
      setState(() {
        this.message = "${this.gameState[3]} Wins";
      });
    } else if ((gameState[6] != "empty") &&
        (gameState[6] == gameState[7]) &&
        (gameState[7] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[6]} Wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[4]) &&
        (gameState[4] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if ((gameState[0] != "empty") &&
        (gameState[0] == gameState[3]) &&
        (gameState[3] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if ((gameState[1] != "empty") &&
        (gameState[1] == gameState[4]) &&
        (gameState[4] == gameState[7])) {
      setState(() {
        this.message = "${this.gameState[1]} Wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[5]) &&
        (gameState[5] == gameState[8])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if ((gameState[2] != "empty") &&
        (gameState[2] == gameState[4]) &&
        (gameState[4] == gameState[6])) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  List<String> gameState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TicTacToe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          
          Expanded(
            
            
            child: GridView.builder(
               //addRepaintBoundaries: true,
              
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                
              
                
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.00,
                mainAxisSpacing: 10.00,
              ),
              
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.00,
                height: 100.00,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.00),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            splashColor: Colors.grey,
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.00,
            child: Text(
              "Reset",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              this.resetGame();
            },
          ),
          Container(
            padding: EdgeInsets.all(20.00),
            child: Text(
              "TicTacToe.in",
              style: TextStyle(
                fontSize: 18.00,
              ),
            ),
          )
        ],
      ),
    );
  }
}
