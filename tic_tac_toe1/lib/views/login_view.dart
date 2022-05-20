import 'package:flutter/material.dart';
import 'package:tic_tac_toe1/constants/route_paths.dart' as routes;
import 'package:tic_tac_toe1/viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () async {
                  var success = await model.login(success: true);
                  if (success) {
                    Navigator.of(context).pushNamed(routes.HomeRoute);
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    model.hasErrorMessage
                        ? Text(
                            model.errorMessage,
                            style: TextStyle(
                              color: Colors.red[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 200,
                      height: 80,
                      alignment: Alignment.center,
                      child: !model.busy
                          ? Text('Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 30))
                          : CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
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
