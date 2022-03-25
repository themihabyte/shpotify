import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              _FormWidget(),
              SizedBox(
                height: 16,
              ),
              Divider(
                color: Color.fromRGBO(217, 218, 220, 1),
                thickness: 1.0,
              ),
              SizedBox(height: 16,),
              _SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool rememberMe = false;

  void _auth(){
    final username = _usernameTextController.text;
    final password = _passwordTextController.text;
    if (username == 'admin' && password == 'admin'){
      print('login');
    }
  }
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
    const textFieldDecoration = InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(118, 118, 118, 1.0))),
        isCollapsed: true,
        contentPadding: EdgeInsets.all(14),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 3.0),));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email address or username',
          style: textStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _usernameTextController,
          decoration: textFieldDecoration,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        SizedBox(
          height: 16,
        ),
        const Text(
          'Forgot your password?',
          style: textStyle,
        ),
        Row(
          children: [
            Checkbox(
                checkColor: Colors.white,
                fillColor:
                    MaterialStateProperty.all(Color.fromRGBO(22, 155, 69, 1.0)),
                value: rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null) {
                      rememberMe = value;
                    }
                  });
                }),
            SizedBox(
              width: 8,
            ),
            Text(
              'Remember me',
              style: textStyle,
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(30, 215, 96, 1.0),
            ),
            onPressed: _auth,
            child: const Text(
              'LOG IN',
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.black,
    );
    return Column(
      children: [
        Text('Don`t have an account?', style: textStyle,),
        SizedBox(height: 16,),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){}, child: Text('SIGN UP FOR SPOTIFY'),
            style: TextButton.styleFrom(
              primary: Color.fromRGBO(106, 106, 106, 1),
              shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey,),
                  borderRadius: BorderRadius.circular(30.0))
            ),),
        )
      ],
    );
  }
}
