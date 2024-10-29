import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final double value;

  const Rate(this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite, color: Colors.red),
        SizedBox(width: 8.0), // Um espaço entre o ícone e o valor de avaliação.
        Text(    // Texto que exibe o valor formatado com uma casa decimal (ou '0.0' caso o valor seja nulo).
          value?.toStringAsFixed(1) ?? '0.0',
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}