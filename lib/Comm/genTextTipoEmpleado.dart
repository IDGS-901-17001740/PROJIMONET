import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class getSearchTipoEmpleado extends StatelessWidget {
  TextEditingController controller;
  List suggestions;
  String hintName;


  getSearchTipoEmpleado({this.controller, this.suggestions, this.hintName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: 400,
      child: SearchField(
        suggestionState: Suggestion.expand,
        searchInputDecoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: hintName,
          labelText: hintName,
          fillColor: Colors.grey[200],
          filled: true,
        ),
        suggestions: suggestions,
        textInputAction: TextInputAction.next,
        hasOverlay: true,
        controller: controller,
        maxSuggestionsInViewPort: 5,
        itemHeight: 57,
        onSuggestionTap: (x) {},
      ),
    );
  }
}
