import 'package:flutter/material.dart';

import 'package:test_flutter_app/layout/input_base.dart';

class MyAppRegistration extends StatelessWidget {

    final roundRadius = 5.0;
    final usernameController = new TextEditingController();
    final passwordController = new TextEditingController();

    MyAppRegistration();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: new AppBar(
                title: Text("Training Flutter"),
            ),
            body: SingleChildScrollView(child:
            Container(
                color: Colors.grey,
                padding: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        Container(height: 20,),
                        Container(
                            decoration: ShapeDecoration(shape: StadiumBorder(), color: Colors.blue),
                            padding: EdgeInsets.all(8),
                            child: Text(
                                "Form Pendaftaran",
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                            )
                        ),
                        Container(height: 20,),
                        createRegularTextField(
                            "Name",
                            "Enter your name",
                            usernameController),
                        createRegularTextField(
                            "Phone",
                            "Enter your phone",
                            usernameController),
                        createRegularTextField(
                            "Email",
                            "Enter your email",
                            usernameController),
                        createRegularTextField(
                            "Username",
                            "Enter your username",
                            usernameController),
                        createPasswordTextField(
                            "Password",
                            "Enter your password",
                            passwordController),
                        Container(height: 20,),
                        createButton(text: "REGISTER", listener: () {
                            Navigator.of(context).pop();
                        })
                    ],
                ))
            ),
        );
    }

    void _buttonTapped() {
        print("Yor have tapped me!\n${usernameController.text}:${passwordController.text}");
    }
}
