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
  String winner = '';
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
                      aspectRatio: 1 / 1, // or 1 for simplicity
                      child: GridView.builder(
                          itemCount: 9,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print('Index of current element : $index');
                                if(gridItems[index] == '') {
                                  setState(() {
                                    gridItems[index] = oTurn ? 'O' : 'X';
                                    oTurn = !oTurn;
                                  });
                                }
                              },
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
                        Text(
                          oTurn ? 'O' : 'X',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Turn',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 40),
                          ),
                        ),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
