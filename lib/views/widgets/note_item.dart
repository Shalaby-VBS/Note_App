import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/screens/edit_note_page.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNotePage(note: note);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        note.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    subtitle: Text(
                      note.subTitle,
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(0.4)),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.black,
                        size: 30,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  note.date,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.4)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
