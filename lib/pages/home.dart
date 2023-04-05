import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List options = ["pedra", "papel", "tesoura"];
  String _message = "Escolha uma Opção";
  String _imagePath = "images/quadradinhos.png";

  void _play(String choice) {
    print("OnTap:" + choice);

    int i = Random().nextInt(options.length);
    String randomChoice = options[i];
    this._imagePath = "images/" + randomChoice +".jpg";
    print("OnTap: " + choice + ", random: " + randomChoice);

    if (
    (choice == "pedra" && randomChoice == "tesoura") ||
        (choice == "papel" && randomChoice == "pedra") ||
        (choice == "tesoura" && randomChoice == "papel")
    ) {
      //Usuário Venceu
      setState(() {
        this._message = "Você venceu";
      });
    } else if (
    (choice == "pedra" && randomChoice == "papel") ||
        (choice == "papel" && randomChoice == "tesoura") ||
        (choice == "tesoura" && randomChoice == "pedra")
    ) {
      setState(() {
        this._message = "Você perdeu";
      });
      // Usuário Perdeu
    } else {
      setState(() {
        this._message = "Empatamos";
      });
      //Empate
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Container(
          padding: EdgeInsets.only(bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top:32, bottom: 16),
                child: Text(
                  "Escolha do App",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Image.asset(_imagePath, height: 150),
              Padding(
                padding: EdgeInsets.only(top:32, bottom: 16),
                child: Text(
                  _message,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _play("pedra"),
                    child: Image.asset("images/pedra.jpg", height: 80,),
                  ),
                  GestureDetector(
                    onTap: () => _play("papel"),
                    child: Image.asset("images/papel.jpg", height: 80,),
                  ),
                  GestureDetector(
                    onTap: () => _play("tesoura"),
                    child: Image.asset("images/tesoura.jpg", height: 80,),
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}