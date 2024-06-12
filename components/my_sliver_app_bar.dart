import 'package:flutter/material.dart';
import 'package:test_2/pages/cart_page.dart';

class MySliverAppBat extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBat({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context)=>CartPage(),
              
              ),
              );
          },
           icon: Icon(Icons.shopping_cart), 
           ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
     foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Padding(
        padding: const EdgeInsets.only(left:33),
        child: Text(
          "sunset Diner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0 , right: 0 , top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
