import 'dart:ui';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
// importing images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool iscross = true;
  String message;
  List<String> gamestate;

// set gamestate to empty
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gamestate = [
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

// playgame method
  playgame(int index) {
    if (this.gamestate[index] == "empty") {
      setState(() {
        if (this.iscross == true) {
          this.gamestate[index] = "cross";
        } else {
          this.gamestate[index] = "circle";
        }
        this.iscross = !this.iscross;
        this.checkwin();
      });
    }
  }

//reset method
  resetgame() {
    setState(() {
      this.gamestate = [
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

//get image method
// ignore: missing_return
  AssetImage getimage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('circle'):
        return circle;
        break;
      case ('cross'):
        return cross;
        break;
    }
  }

//winning method
  checkwin() {
    if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[1]) &&
        (gamestate[1] == gamestate[2])) {
      setState(() {
        this.message = "${this.gamestate[0]}wins";
        this.delay();
      });
    } else if ((gamestate[3] != 'empty') &&
        (gamestate[3] == gamestate[4]) &&
        (gamestate[4] == gamestate[5])) {
      setState(() {
        this.message = "${this.gamestate[3]}wins";
        this.delay();
      });
    } else if ((gamestate[6] != 'empty') &&
        (gamestate[6] == gamestate[7]) &&
        (gamestate[7] == gamestate[8])) {
      setState(() {
        this.message = "${this.gamestate[6]}WINS";
        this.delay();
      });
    } else if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[3]) &&
        (gamestate[3] == gamestate[6])) {
      setState(() {
        this.message = "${this.gamestate[0]}WINS";
        this.delay();
      });
    } else if ((gamestate[1] != 'empty') &&
        (gamestate[1] == gamestate[4]) &&
        (gamestate[4] == gamestate[7])) {
      setState(() {
        this.message = "${this.gamestate[1]}wins";
        this.delay();
      });
    } else if ((gamestate[2] != 'empty') &&
        (gamestate[2] == gamestate[5]) &&
        (gamestate[5] == gamestate[8])) {
      setState(() {
        this.message = "${this.gamestate[2]}wins";
        this.delay();
      });
    } else if ((gamestate[0] != 'empty') &&
        (gamestate[0] == gamestate[4]) &&
        (gamestate[4] == gamestate[8])) {
      setState(() {
        this.message = "${this.gamestate[0]}wins";
        this.delay();
      });
    } else if ((gamestate[2] != 'empty') &&
        (gamestate[2] == gamestate[4]) &&
        (gamestate[4] == gamestate[6])) {
      setState(() {
        this.message = "${this.gamestate[2]}wins";
        this.delay();
      });
    } else if (!this.gamestate.contains('empty')) {
      setState(() {
        this.message = 'GAME DRAW';
        this.delay();
      });
    }
  }

// delay function
  delay() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        this.resetgame();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIC TAC TOE GAME'),
        backgroundColor: Colors.green,
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
                childAspectRatio: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gamestate.length,
              itemBuilder: (context, index) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playgame(index);
                  },
                  child: Image(image: this.getimage(this.gamestate[index])),
                ),
              ),
            )),
            Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                child: Text(this.message,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ))),
            MaterialButton(
                padding: EdgeInsets.all(20.0),
                color: Colors.green,
                minWidth: 300.0,
                height: 50.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500.0)),
                child: Text('RESET GAME',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                onPressed: () {
                  this.resetgame();
                }),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Made By @mustare.deepak',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            )
          ]),
    );
  }
}
