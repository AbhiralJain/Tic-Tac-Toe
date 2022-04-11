import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool gameon = true;
  String winner = '';
  int player = 1;
  List<int> board = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  checkwin(player) {
    if (board[0] == player && board[1] == player && board[2] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[3] == player && board[4] == player && board[5] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[6] == player && board[7] == player && board[8] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[0] == player && board[3] == player && board[6] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[1] == player && board[4] == player && board[7] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[2] == player && board[5] == player && board[8] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[0] == player && board[4] == player && board[8] == player) {
      winner = 'Player $player won';
      gameon = false;
    } else if (board[2] == player && board[4] == player && board[6] == player) {
      winner = 'Player $player won';
      gameon = false;
    }
  }

  boardcell(index) {
    return GestureDetector(
      onTap: () {
        if (board[index] == 0 && gameon) {
          setState(() {
            board[index] = player;
            checkwin(player);
            if (player == 1) {
              player = 2;
            } else {
              player = 1;
            }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        alignment: Alignment.center,
        child: boardmark(index),
      ),
    );
  }

  boardmark(index) {
    if (board[index] == 0) {
      return null;
    } else if (board[index] == 1) {
      return const Icon(Icons.done_rounded, size: 50, color: Colors.green);
    } else {
      return const Icon(Icons.close_rounded, size: 50, color: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Tic Tac Toe', style: TextStyle(fontSize: 35)),
              Text(winner, style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.height / 1.5,
                alignment: Alignment.center,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  children: [for (int i = 0; i < 9; i++) boardcell(i)],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
