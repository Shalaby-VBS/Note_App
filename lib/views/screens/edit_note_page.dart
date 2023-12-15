import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_app_bar.dart';
import 'package:note_app/views/widgets/custom_formfiled.dart';
import 'package:note_app/views/widgets/edit_note_colorlist.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                function: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subTitle ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                title: 'Edite note',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                onchange: (value) {
                  title = value;
                },
                initialValue: widget.note.title,
                hintText: widget.note.title,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomFormFiled(
                onchange: (value) {
                  subTitle = value;
                },
                initialValue: widget.note.subTitle,
                maxLines: 5,
                hintText: widget.note.subTitle,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 38 * 2,
                child: EditNoteListView(note: widget.note),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
