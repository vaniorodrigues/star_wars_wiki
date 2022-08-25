import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:star_wars_wiki/screens/home_screen.dart';

class FluttermojiPage extends StatefulWidget {
  const FluttermojiPage({Key? key}) : super(key: key);

  @override
  FluttermojiPageState createState() => FluttermojiPageState();
}

class FluttermojiPageState extends State<FluttermojiPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Edite aqui o seu avatar!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(
              //   width: min(600, width * 0.85),
              //   child: Row(
              //     children: [
              //       Spacer(),
              //       Container(
              //         padding: EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           color: Colors.black45,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         // color: buttonTopArea,
              //         child: Column(
              //           children: [
              //             FluttermojiSaveWidget(
              //               radius: 10,
              //               splashColor: Colors.white,
              //             ),
              //             Text(
              //               'Salvar',
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w600,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: FluttermojiCircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: FluttermojiCustomizer(
                  scaffoldWidth: min(600, width * 0.85),
                  autosave: false,
                  theme: FluttermojiThemeData(boxDecoration: BoxDecoration(boxShadow: const [BoxShadow()])),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

// class FluttermojiCustomizePage extends StatelessWidget {
//   const FluttermojiCustomizePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return Center(
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 30),
//               child: FluttermojiCircleAvatar(
//                 radius: 100,
//                 backgroundColor: Colors.grey[200],
//               ),
//             ),
//             SizedBox(
//               width: min(600, width * 0.85),
//               child: Row(
//                 children: [
//                   Text(
//                     'Customize:',
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                   Spacer(),
//                   FluttermojiSaveWidget(),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
//               child: FluttermojiCustomizer(
//                 scaffoldWidth: min(600, width * 0.85),
//                 autosave: false,
//                 theme: FluttermojiThemeData(boxDecoration: BoxDecoration(boxShadow: const [BoxShadow()])),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
