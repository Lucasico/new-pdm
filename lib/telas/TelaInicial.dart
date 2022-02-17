import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaIncial extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return TelaInicialState();
  }

}


class TelaInicialState extends State<TelaIncial>{
  String _textoResultado = "IMC: 74";
  String _urlImage = '';
  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController  _controllerAltura = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora de IMC"),),
      body: Column(
        children: <Widget>[
          criarCampoTexto("Peso (kg):", _controllerPeso), criarCampoTexto("Altura (cm):", _controllerAltura),
          Text(_textoResultado, style: TextStyle(fontSize: 25.0),),
          
         Container(
           height: 50.0, width: 200.0,
           child: ElevatedButton(
              onPressed: (){
                  double? peso = double.tryParse(_controllerPeso.text);
                  double? altura = double.tryParse(_controllerAltura.text);

                  debugPrint('Peso: $peso');
                  debugPrint('Peso: $altura');
                if (peso != null && altura != null) {
                    altura = altura / 100.0;

                    double _imc = (peso / (altura * altura));

                    setState(() {
                      if (_imc < 18.5) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nAbaixo do Peso";
                         _urlImage = "https://i.ytimg.com/vi/GWO-4FEuJAI/maxresdefault.jpg";
                      } else if (_imc >= 18.5 && _imc <= 24.9) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nPeso Normal";
                         _urlImage = "https://pbs.twimg.com/profile_images/1366466342354751491/JyhZpbtu_400x400.jpg";
                      } else if (_imc >= 25.0 && _imc <= 29.9) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nSobrepeso";
                         _urlImage = "http://pm1.narvii.com/6478/31ac1cc4b69f3bc6733883164ddfcb643acdaac4_00.jpg";
                      } else if (_imc >= 30.0 && _imc <= 34.9) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau l";
                         _urlImage = "https://static.wikia.nocookie.net/dragonball/images/e/e4/MajinBuuSuperNV..png/revision/latest?cb=20150121003048&path-prefix=pt-br";
                      } else if (_imc >= 35 && _imc <= 39.9) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau ll";
                         _urlImage = "https://kanto.legiaodosherois.com.br/w728-h381-gnw-cfill-gcc/wp-content/uploads/2021/10/legiao_0Ovd7XqbTIos.png.jpeg";
                      } else if (_imc > 39.9) {
                         _textoResultado = " IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau lll (Mórbida)";
                         _urlImage = "https://www.lance.com.br/files/article_main/uploads/2021/05/17/60a320101ca78.jpeg";
                      }
                    });
                  } else {
                    setState(() {
                       _textoResultado = 'Preencha os campos para IMC';
                    });
                  }
              },

             child: Text("Calcular IMC"),
           ),
         ),

         Container(
           child: _urlImage != '' ? Image.network(_urlImage) : null,
         )
        ],
      ),

    );
  }

  TextField criarCampoTexto(String texto, TextEditingController controller) {
    return TextField(
          controller: controller ,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: texto,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 25.0, color: Colors.blue
            )
          ),
        );
  }

}