import 'package:flutter/material.dart';

class InputHomePage extends StatefulWidget {
  const InputHomePage({ Key? key }) : super(key: key);

  @override
  State<InputHomePage> createState() => _InputHomePageState();
}


class _InputHomePageState extends State<InputHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  usernameTextField(),
                  PasswordTextField(),
                  const SizedBox(height: 16,),
                  submitBtn(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton submitBtn() {
    return ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                print(_username.text);
              }
            },
             child: Text('Submit'),
          );
  }


   Widget PasswordTextField() {
    return Container(
      width: 300,
      margin: EdgeInsets.all(8),
      child: TextFormField(
              obscureText: true,
              controller: _password,
              validator: (value) {
                if (value!.isEmpty){
                  return "Please Enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),

              ),
      ),
    );
  }

  Widget usernameTextField() {
    return Container(
      width: 300,
      margin: EdgeInsets.all(8),
      child: TextFormField(
              controller: _username,
              validator: (value) {
                if (value!.isEmpty){
                  return "Please Enter Username";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'UserName',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),

              ),
      ),
    );
  }

}