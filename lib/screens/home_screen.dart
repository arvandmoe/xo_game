import 'package:flutter/material.dart';
import '../values/colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> gridItems = ['', '', '', '', '', '', '', '', '',];
  bool oTurn = true;
  String gameWinner = '';
  bool gameFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MColors.background,
        child: Row(
          children: [
            // XO grid
            Expanded(
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AspectRatio(
                      aspectRatio: 1 / 1, // or simply 1
                      child: GridView.builder(
                          itemCount: gridItems.length, 
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => _gridOnTap(index),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.white60, borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    gridItems[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 120),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )),
            // right side
            Expanded(
                flex: 1,
                child: Container(
                    color: Colors.white24,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         if(!gameFinished)
                         Text(
                          oTurn ? 'O' : 'X',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        if(!gameFinished)
                          Text(
                            'Turn',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 60),
                          ),
                        if(gameFinished)
                          Text(
                            gameWinner,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 60),
                          ),
                        if(gameFinished)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            gameWinner != '' ? 'Won' : 'Draw',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                        ),
                        SizedBox(height: 32,),
                        if(gameFinished)
                        MaterialButton(onPressed: (){
                          setState(() {
                          gameFinished = false;
                          gameWinner = '';
                          oTurn = true;
                          gridItems = ['', '', '', '', '', '', '', '', '',];
                        });},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('reset',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                        ),)
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  void _gridOnTap(int index) {
     print('Index of current element : $index');
     if(gridItems[index] == '' && !gameFinished) {
       setState(() {
         gridItems[index] = oTurn ? 'O' : 'X';
         oTurn = !oTurn;
       });
     }
     _checkResult();
  }

  void _checkResult() {
    // horizontal check
    if([gridItems[0] ,gridItems[1] ,gridItems[2]].every((element) => element == gridItems[0] && element != '')) {
      _endGame(winner: gridItems[0]);
    }
    else if([gridItems[3] ,gridItems[4] ,gridItems[5]].every((element) => element == gridItems[3] && element != '')) {
      _endGame(winner: gridItems[3]);
    }
    else if([gridItems[6] ,gridItems[7] ,gridItems[8]].every((element) => element == gridItems[6] && element != '')) {
      _endGame(winner: gridItems[6]);
    }
    // vertical check
    else if([gridItems[0] ,gridItems[3] ,gridItems[6]].every((element) => element == gridItems[0] && element != '')) {
      _endGame(winner: gridItems[0]);
    }
    else if([gridItems[1] ,gridItems[4] ,gridItems[7]].every((element) => element ==  gridItems[1] && element != '')) {
      _endGame(winner: gridItems[1]);
    }
    else if([gridItems[2] ,gridItems[5] ,gridItems[8]].every((element) => element == gridItems[2] && element != '')) {
      _endGame(winner: gridItems[2]);
    }
    // diagonal check
    else if([gridItems[0] ,gridItems[4] ,gridItems[8]].every((element) => element == gridItems[0] && element != '')) {
      _endGame(winner: gridItems[0]);
    }
    else if([gridItems[2] ,gridItems[4] ,gridItems[6]].every((element) => element == gridItems[2] && element != '')) {
      _endGame(winner: gridItems[2]);
    }
    else if(gridItems.every((element) => element != '')) {
      _callDraw();
    }

  }

  void _endGame({required String winner}) {
    print('_endGame : $winner won!');
    setState(() {
      gameFinished = true;
      gameWinner = winner;
    });
  }

  void _callDraw() {
    print('_onDraw');
    setState(() {
      gameFinished = true;
      gameWinner = '';
    });
  }
}
