import 'package:breadfast/Screens/MapScreen.dart';
import 'package:flutter/material.dart';

class MySign extends StatefulWidget {
  @override
  _MySignState createState() => _MySignState();
}

TextEditingController _controller = TextEditingController();

class _MySignState extends State<MySign> {
  _sign() {
    if (!_FormKey.currentState.validate()) {
      return;
    } else
      _FormKey.currentState.save();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MapScreen()));
  }

  String name;
  String email;
  String pass;
  String newpass;
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  Widget _TextForm1(
      {TextInputType type,
      IconData icon,
      String label,
      FocusNode focus,
      Function v,
      Function save,
      bool obsecure,
      TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Material(
        elevation: focus.hasFocus ? 10 : 0,
        child: TextFormField(
          controller: controller,
          obscureText: obsecure,
          onSaved: save,
          validator: v,
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
              color: Colors.black,
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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Create Account",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Form(
                key: _FormKey,
                child: Column(
                  children: [
                    _TextForm1(
                        type: TextInputType.text,
                        icon: Icons.person_outline,
                        label: "FULL NAME",
                        focus: f1,
                        obsecure: false,
                        v: (String value) {
                          if (value.isEmpty) {
                            return "Name is Required";
                          }
                        },
                        save: (String value) {
                          setState(() {
                            name = value;
                          });
                        }),
                    _TextForm1(
                        type: TextInputType.emailAddress,
                        icon: Icons.mail_outline,
                        label: "EMAIL",
                        focus: f2,
                        obsecure: false,
                        v: (String value) {
                          if (value.isEmpty) {
                            return "Email is Required";
                          }
                        },
                        save: (String value) {
                          setState(() {
                            email = value;
                          });
                        }),
                    _TextForm1(
                        controller: _controller,
                        type: TextInputType.text,
                        icon: Icons.lock_outline,
                        label: "PASSWORD",
                        focus: f3,
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
                        }),
                    _TextForm1(
                      type: TextInputType.text,
                      icon: Icons.lock_outline,
                      label: "CONFIRM PASSWORD",
                      focus: f4,
                      obsecure: true,
                      v: (String newvalue) {
                        if (newvalue.isEmpty) {
                          return "Password is Required";
                        } else if (newvalue != _controller.text) {
                          return "Password isn't equal";
                        }
                      },
                      save: (String newvalue) {
                        setState(() {
                          newpass = newvalue;
                        });
                      },
                    ),
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
                        _sign();
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
                              "SIGN UP",
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
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black45),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign in",
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
        ),
      ),
    );
  }
}
