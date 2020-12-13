import 'package:flutter/material.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 12),
          submitButton(),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            bloc.changeEmail(value);
          },
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'example@example.com',
            labelText: 'Email',
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: (value) {
            bloc.changePassword(value);
          },
          obscureText: true,
          decoration: InputDecoration(
            errorText: snapshot.error,
            hintText: 'password',
            labelText: 'Password',
          ),
        );
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      onPressed: () {},
      child: Text('Submit'),
      color: Colors.cyan,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }
}
