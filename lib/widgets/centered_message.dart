import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget { // Define a classe CenteredMessage, que é um widget imutável (StatelessWidget).
  final String message;
  final Color color;
  final double iconSize;
  final IconData icon;
  final double space;
  final EdgeInsets padding;

  const CenteredMessage({ // Construtor da classe que permite a personalização dos atributos.
    Key? key,
    required this.message,
    this.color = Colors.white24,
    this.iconSize = 64.0,
    this.icon = Icons.warning,
    this.space = 10.0,
    this.padding = const EdgeInsets.all(20.0)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildIcon(),
          SizedBox(height: space),
          _buildText(),
        ],
      ),
    );
  }

  _buildIcon() { // Método para construir o widget de ícone.
    return Icon(
      icon,
      color: color,
      size: iconSize,
    );
  }

  _buildText() { // Método para construir o widget de texto.
    return Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: color),
    );
  }
}