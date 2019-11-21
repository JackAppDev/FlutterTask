import 'package:flutter/material.dart';

import 'FeedbackTextField.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({
    Key key,
  }) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameKey = UniqueKey();
  final _lastNameKey = UniqueKey();
  final _emailKey = UniqueKey();
  final _messageKey = UniqueKey();

  String _firstName;
  String _lastName;
  String _email;
  String _message;

  bool get _isValid {
    if (_firstName?.isEmpty ?? true) {
      return false;
    }

    if (_lastName?.isEmpty ?? true) {
      return false;
    }

    if (_message?.isEmpty ?? true) {
      return false;
    }

    final emailRegex = RegExp(r"[^\s]+@[^\s]+\.[^\s]+");
    if ((_email?.isEmpty ?? true) || !emailRegex.hasMatch(_email)) {
      return false;
    }

    return true;
  }

  _submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Submitted"),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0, 1],
              colors: [
                Color(0xff2a2a2a),
                Color(0xff191919),
              ],
            ),
          ),
          child: Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffe7e7e7),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Feedback",
                      textScaleFactor: 2,
                      style: Theme.of(context).textTheme.title.copyWith(
                            color: Color(0xffbb8ce5),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    FeedbackTextField(
                      key: _firstNameKey,
                      hintText: "First name",
                      onChanged: (value) {
                        setState(() {
                          _firstName = value;
                        });
                      },
                    ),
                    FeedbackTextField(
                      key: _lastNameKey,
                      hintText: "Last name",
                      onChanged: (value) {
                        setState(() {
                          _lastName = value;
                        });
                      },
                    ),
                    FeedbackTextField(
                      key: _emailKey,
                      hintText: "Email",
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                    ),
                    FeedbackTextField(
                      key: _messageKey,
                      height: null,
                      maxLines: 5,
                      maxLength: 500,
                      hintText: "Message",
                      onChanged: (value) {
                        setState(() {
                          _message = value;
                        });
                      },
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${_message?.length ?? 0}/500",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Material(
                      elevation: 0,
                      borderRadius: BorderRadius.circular(4),
                      color: _isValid
                          ? Color(0xffd3a1ff)
                          : Color(0xffd3a1ff).withAlpha(255 ~/ 2),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: _isValid ? _submit : null,
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
