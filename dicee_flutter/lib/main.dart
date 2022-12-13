import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DicePage(),
          ],
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int get randomNumber => 1 + Random().nextInt(6);

  late int leftDiceNumber;
  late int rightDiceNumber;

  @override
  void initState() {
    leftDiceNumber = randomNumber;
    rightDiceNumber = randomNumber;
    // TODO: implement initState
    super.initState();
  }

  int getRandom() {
    return 1 + Random().nextInt(6);
  }

  void changeState() {
    leftDiceNumber = randomNumber;
    rightDiceNumber = randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                setState(() {
                  changeState();
                  print('leftDiceNumber = ${leftDiceNumber}');
                });
              },
              child: Image.asset(
                'images/dice${leftDiceNumber}.png',
                // 'images/dice${randomNumber}.png',
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                setState(() {
                  changeState();
                  print('rightDiceNumber = ${rightDiceNumber}');
                });
              },
              child: Image.asset(
                'images/dice${rightDiceNumber}.png',
                // 'images/dice${randomNumber}.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// class Dice extends StatefulWidget {
//   const Dice({Key? key}) : super(key: key);
//
//   @override
//   State<Dice> createState() => _DiceState();
// }
//
// class _DiceState extends State<Dice> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex: 1,
//       child: TextButton(
//         onPressed: () {
//           setState(() {
//             changeState();
//             print('rightDiceNumber = ${rightDiceNumber}');
//           });
//         },
//         child: Image.asset(
//           'images/dice${rightDiceNumber}.png',
//           // 'images/dice${randomNumber}.png',
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My Ecommerce App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('My Ecommerce App'),
//         ),
//         body: ProductList(),
//       ),
//     );
//   }
// }
//
// class ProductList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return ProductItem();
//       },
//     );
//   }
// }
//
// class ProductItem extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         children: <Widget>[
//           Image.asset('assets/shoe.png'),
//           Text('Product Name'),
//           Text('Product Description'),
//           Text('Price'),
//           MaterialButton(
//             onPressed: () {
//               // Add product to cart
//             },
//             child: Text('Add to Cart'),
//           ),
//         ],
//       ),
//     );
//   }
// }


