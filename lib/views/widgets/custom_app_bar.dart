import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.icon, this.function});
  final String title;
  final IconData icon;
  final void Function()? function;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: function,
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.2),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
//     return AppBar(
//       titleSpacing: 16,
//       backgroundColor: const Color(0xff2E312E),
//       elevation: 0,
//       title: const Text(
//         'Notes',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white.withOpacity(0.3),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.all(5),
//               child: Icon(Icons.search),
//             ),
//           ),
//         )
//       ],
//     );
  }
}
