import 'package:flutter/material.dart';
import 'package:note_app/helper/constants.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_item.dart';

class EditNoteListView extends StatefulWidget {
  final NoteModel note;
  const EditNoteListView({
    super.key,
    required this.note,
  });

  @override
  State<EditNoteListView> createState() => _EditNoteListViewState();
}

class _EditNoteListViewState extends State<EditNoteListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColorList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: kColorList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            currentIndex = index;
            widget.note.color = kColorList[index].value;
            setState(() {});
          },
          child: ColorItem(
            isActive: currentIndex == index,
            color: kColorList[index],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 10,
        );
      },
    );
  }
}
