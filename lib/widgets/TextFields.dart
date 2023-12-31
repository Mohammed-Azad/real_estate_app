import 'package:flutter/material.dart';

class textFields extends StatelessWidget {
  final String namelabel;
  final bool pass;
  final bool focus;
  final TextInputType keyboardtype;
  final TextEditingController control;
  const textFields(this.namelabel, this.pass, this.focus, this.keyboardtype,this.control,
      {super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      keyboardType: keyboardtype,
      autofocus: focus,
      obscureText: pass,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: namelabel,
        labelStyle: TextStyle(
            color: Theme.of(context).hintColor, fontWeight: FontWeight.w500),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(199, 160, 130, 241), width: 2),
        ),
      ),
    );
  }
}
