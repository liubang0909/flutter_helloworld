import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.orange),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [RegisterFormDemo()],
              ),
            )),
      ),
    );
  }
}

class RegisterFormDemo extends StatefulWidget {
  RegisterFormDemo({Key key}) : super(key: key);

  @override
  _RegisterFormDemoState createState() => _RegisterFormDemoState();
}

class _RegisterFormDemoState extends State<RegisterFormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  void submitForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('正在注册'),
    ));
    debugPrint("$username,$password");
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return "username is empty";
    }

    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return "password is empty";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          key: registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'userName', helperText: ''),
                onSaved: (newValue) => (username = newValue),
                validator: validatorUsername,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              TextFormField(
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:
                    InputDecoration(labelText: 'passWord', helperText: ''),
                onSaved: (newValue) => (password = newValue),
                validator: validatorPassword,
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 0,
                  child: Text(
                    '提交',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: submitForm,
                ),
              )
            ],
          )),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      debugPrint("${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        // onChanged: (value) => (debugPrint("$value")),
        controller: textEditingController,
        onSubmitted: (value) => (debugPrint("$value")),
        decoration: InputDecoration(
            icon: Icon(Icons.subject),
            labelText: 'title',
            hintText: "我是提示文字",
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Colors.grey[200]),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
