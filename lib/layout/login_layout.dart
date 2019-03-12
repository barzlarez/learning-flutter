import 'package:flutter/material.dart';
import 'package:test_flutter_app/layout/input_base.dart';

class MyAppLogin extends StatefulWidget {
    @override
    _MyAppLogin createState() => _MyAppLogin();
}

class _MyAppLogin extends State<MyAppLogin> {

    final roundRadius = 5.0;
    final usernameController = new TextEditingController();
    final passwordController = new TextEditingController();
    bool isChecked = false;

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
                                "Selamat Datang",
                                style: TextStyle(fontSize: 24),
                                textAlign: TextAlign.center,
                            )
                        ),
                        Container(height: 20,),
                        createRegularTextField(
                            "Username",
                            "Enter your username",
                            usernameController,
                            TextInputType.emailAddress),
                        createPasswordTextField(
                            "Password",
                            "Enter your password",
                            passwordController),
                        CheckboxListTile(
                            value: isChecked,
                            title: Text("save password"),
                            activeColor: Colors.red,
                            onChanged: (changed) {
                                setState(() {
                                    isChecked = changed;
                                });
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text("Checkbox checked"))
                                );
                            }),
                        Container(height: 20,),
                        createButton(text: "LOGIN", listener: () {
                            Navigator.of(context).pushNamed("/list");
                        }),
                        createButton(text: "REGISTER", listener: () {
                            Navigator.of(context).pushNamed("/register");
//                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppRegistration()));
                        })
                    ],
                ))
            ),
        );
    }

    void _registerTapped({context: BuildContext}) {
        Navigator.of(context).pushNamed("/register");
        //                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppRegistration()));
        print("Yor have tapped me!\n${usernameController.text}:${passwordController.text}");
    }
}
