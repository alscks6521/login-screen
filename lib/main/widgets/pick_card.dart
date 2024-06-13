import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickCard extends StatelessWidget {
  const PickCard({super.key});

  Widget _buildCard(Color color) {
    Widget child(bool isFeedBack) => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: isFeedBack ? 3 : 0),
          ),
        );

    return Draggable<Color>(
      data: color,
      feedback: child(true),
      child: child(false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Rxn<Color> rxColor = Rxn();

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Expanded(
            child: Obx(() {
              final color = rxColor.value;

              return DragTarget(
                onAcceptWithDetails: (details) {
                  if (details.data is Color) {
                    rxColor.value = details.data as Color;
                  }

                  debugPrint("${details.data}");
                },
                builder: (context, candidateData, rejectedData) {
                  String text = 'Drage And Drop';
                  if (candidateData.isNotEmpty) {
                    text = 'Drop the Card!';
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: color,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(text),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCard(Colors.red),
                _buildCard(Colors.blue),
                _buildCard(Colors.yellow),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// ## Stateful 사용한 드래그 제스처

// import 'package:flutter/material.dart';

// class PickCard extends StatefulWidget {
//   const PickCard({super.key});

//   @override
//   State<PickCard> createState() => _PickCardState();
// }

// class _PickCardState extends State<PickCard> {
//   Widget _buildCard(Color color) {
//     Widget child(isFeedBack) => Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//             color: color,
//             borderRadius: BorderRadius.circular(4),
//             border: Border.all(width: isFeedBack ? 3 : 0),
//           ),
//         );

//     return Draggable(
//       data: color,
//       feedback: child(true),
//       child: child(false),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(
//         children: [
//           Expanded(
//             child: DragTarget(
//               onAcceptWithDetails: (details) {
//                 debugPrint("${details.data}");
//               },
//               builder: (context, candidateData, rejectedData) {
//                 String text = 'Drage And Drop';
//                 if (candidateData.isNotEmpty) {
//                   text = 'Drop the Card!';
//                 }
//                 return Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   alignment: Alignment.center,
//                   child: Text(text),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _buildCard(Colors.red),
//               _buildCard(Colors.blue),
//               _buildCard(Colors.yellow),
//             ],
//           ))
//         ],
//       ),
//     );
//   }
// }
