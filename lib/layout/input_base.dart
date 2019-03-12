import 'package:flutter/material.dart';

TextField createRegularTextField(String label,
                                 String hint,
                                 TextEditingController controller,
                                 [TextInputType inputType]) {
    return createTextField(label, hint, false, controller, inputType);
}

TextField createPasswordTextField(String label,
                                  String hint,
                                  TextEditingController controller,
                                  [TextInputType inputType]) {
    return createTextField(label,hint, true, controller, inputType);
}

TextField createTextField(String label,
                          String hint,
                          bool isPassword,
                          TextEditingController controller,
                          [TextInputType inputType]) {
    return TextField(
        controller: controller,
        cursorColor: Colors.green,
        style: TextStyle(
            decorationColor: Colors.indigo),
        keyboardType: (inputType == null)? TextInputType.text : inputType,
        obscureText: isPassword,
        decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            labelStyle: TextStyle(color: Colors.indigo),
        ),
    );
}

RaisedButton createButton({text: String, listener: VoidCallback}) {
    return RaisedButton(
        onPressed: listener,
        child: Text(text),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        highlightColor: Colors.brown,
        splashColor: Colors.green,
    );
}