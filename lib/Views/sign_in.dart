import 'package:flutter/material.dart';

class MySignInPage extends StatelessWidget {
  MySignInPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: [
            SizedBox(
              height: s.height * 0.2,
            ),
            Flexible(
                child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: s.height * 0.06,
                    ),
                    Text(
                      "SIGN UP",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: s.height * 0.06,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {}, child: const Text("Sign up")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}
