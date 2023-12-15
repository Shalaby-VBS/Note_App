import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add_bottom_sheet.dart';

import 'package:note_app/views/widgets/notes_body.dart';
import '../widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return const Wrap(
                  children: <Widget>[AddBottomSheet()],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            CustomAppBar(
              title: 'Notes',
              icon: Icons.search,
            ),
            NotesBody(),
          ],
        ),
      ),
    );
  }
}
