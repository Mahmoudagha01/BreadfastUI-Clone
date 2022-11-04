import 'package:breadfast/Screens/MapScreen.dart';
import 'package:breadfast/Screens/sign.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  _login(context) {
    if (!_FormKey.currentState.validate()) {
      return;
    } else
      _FormKey.currentState.save();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
  }

  String phone;
  String pass;

  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  Widget _TextForm(
      {TextInputType type,
      IconData icon,
      String label,
      FocusNode focus,
      Function v,
      Function save,
      bool obsecure}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Material(
        elevation: focus.hasFocus ? 10 : 0,
        child: TextFormField(
          obscureText: obsecure,
          validator: v,
          onSaved: save,
          keyboardType: type,
          focusNode: focus,
          onTap: () {
            setState(() {
              focus = f1;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black54,
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: focus.hasFocus ? Colors.black : Colors.black54,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            alignLabelWithHint: false,
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: UnderlineInputBorder(
              borderSide: BorderSide(),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  children: [
                    Text(
                      "Please sign in to continue.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.5)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                key: _FormKey,
                child: Column(
                  children: [
                    _TextForm(
                        type: TextInputType.phone,
                        icon: Icons.phone,
                        label: "PHONE NUMBER",
                        focus: f1,
                        obsecure: false,
                        v: (value) {
                          if (value.isEmpty) {
                            return "Phone is Required";
                          }
                        },
                        save: (value) {
                          setState(() {
                            phone = value;
                          });
                        }),
                    _TextForm(
                        type: TextInputType.text,
                        icon: Icons.lock,
                        label: "PASSWORD",
                        focus: f2,
                        obsecure: true,
                        v: (value) {
                          if (value.isEmpty) {
                            return "Password is Required";
                          }
                        },
                        save: (value) {
                          setState(() {
                            pass = value;
                          });
                        })
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        _login(context);
                      },
                      child: Container(
                        width: 130,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(237, 52, 190, 1),
                            Color.fromRGBO(237, 52, 190, 1),
                            Theme.of(context).primaryColor
                          ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black45),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MySign()));
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
