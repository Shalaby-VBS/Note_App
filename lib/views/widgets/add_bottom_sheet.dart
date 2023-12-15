import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/custom_form_bottn.dart';
import 'package:note_app/views/widgets/custom_formfiled.dart';

import 'bottom_sheet_colorlist.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 32,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidate,
              child: Column(
                children: [
                  CustomFormFiled(
                    onsaved: (value) {
                      title = value;
                    },
                    hintText: 'Title',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormFiled(
                    onsaved: (value) {
                      subTitle = value;
                    },
                    hintText: 'content',
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    height: 38 * 2,
                    child: ColorListView(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<AddNoteCubit, AddNoteState>(
                    builder: (context, state) {
                      return CustomFormBottn(
                        loadingIndecator:
                            state is AddNoteLoading ? true : false,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var currentDate = DateTime.now();
                            var formattedDate =
                                DateFormat('dd-MM-yyyy').format(currentDate);
                            var note = NoteModel(
                                title: title!,
                                subTitle: subTitle!,
                                date: formattedDate,
                                color: Colors.purple.value);
                            BlocProvider.of<AddNoteCubit>(context)
                                .addNote(note);
                          } else {
                            autoValidate = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
