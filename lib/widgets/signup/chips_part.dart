// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

import 'package:api_test/models/interest.dart';

class ChipsPart extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  ChipsPart({
    Key? key,
    required this.controller,
    required this.errorText,
  }) : super(key: key);

  @override
  State<ChipsPart> createState() => _ChipsPartState();
}

class _ChipsPartState extends State<ChipsPart> {
  final _chipkey = GlobalKey<ChipsInputState>();

  List<Interest> _selectedInterest = [];

  List<Interest> _interest = [
    Interest(id: 1, name: 'Photoshop'),
    Interest(id: 2, name: 'Coding'),
    Interest(id: 3, name: 'Hacking'),
    Interest(id: 4, name: 'Cloud'),
    Interest(id: 5, name: 'Designing'),
    Interest(id: 6, name: 'Cooking'),
    Interest(id: 7, name: 'Beautician'),
    Interest(id: 8, name: 'Health'),
    Interest(id: 9, name: 'Lifestyle'),
    Interest(id: 10, name: 'Tailoring'),
    Interest(id: 11, name: 'Data Science'),
    Interest(id: 12, name: 'Hadoop'),
    Interest(id: 13, name: 'Photography')
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
              blurStyle: BlurStyle.inner,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChipsInput(
                key: _chipkey,
                inputAction: TextInputAction.next,
                keyboardAppearance: Brightness.dark,
                textCapitalization: TextCapitalization.words,
                textStyle: TextStyle(
                  height: 1,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Select your interest',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
                findSuggestions: (String query) {
                  if (query.isNotEmpty) {
                    var lowerCaseQuery = query.toLowerCase();
                    return _interest.where(
                      (profile) {
                        return profile.name.toLowerCase().contains(
                              query.toLowerCase(),
                            );
                      },
                    ).toList(growable: false)
                      ..sort(
                        (a, b) => a.name
                            .toLowerCase()
                            .indexOf(lowerCaseQuery)
                            .compareTo(
                              b.name.toLowerCase().indexOf(lowerCaseQuery),
                            ),
                      );
                  }
                  return _interest;
                },
                onChanged: (value) => setState(() {
                  value = _selectedInterest;
                }),
                chipBuilder: (context, state, dynamic profile) {
                  return InputChip(
                    key: ObjectKey(profile),
                    label: Text(profile.name),
                    onDeleted: () => state.deleteChip(profile),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  );
                },
                suggestionBuilder: (context, state, dynamic profile) {
                  return ListTile(
                    key: ObjectKey(profile),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Icon(
                        Icons.interests,
                      ),
                    ),
                    title: Text(profile.name),
                    onTap: () => state.selectSuggestion(profile),
                  );
                },
              ),
              Container(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    errorText: widget.errorText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
