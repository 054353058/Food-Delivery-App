

import 'package:flutter/material.dart';

import '../models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onInDecremnt; 
  final VoidCallback onDecremnt; 


  const QuantitySelector({
    super.key,
    required this.quantity , 
    required this.food , 
    required this.onDecremnt , 
    required this.onInDecremnt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
     padding: EdgeInsets.all(8),
     child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onDecremnt,
          child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child:Text(
                quantity.toString(),
              ), 
            ),
          ),
      

         GestureDetector(
          onTap: onInDecremnt,
          child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
      ],
     ),
    );
  }
}
