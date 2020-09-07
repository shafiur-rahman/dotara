import 'package:dotara/constants/RoutingConstants.dart';
import 'package:dotara/values/ColorsLocal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _singIn() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
              width: double.infinity,
              child: MaterialButton(
                color: ColorsLocal.hexToColor("3C5A95"),
                clipBehavior: Clip.antiAlias,
                onPressed: () async {
                  // snapshot.signInFacebook().then((value) => Navigator.pushReplacementNamed(context, HomeRoute));
                  Navigator.pushReplacementNamed(context, HomeRoute);
                },
                child: Text(
                  "Sign up with facebook",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
//                      side: BorderSide(color: Colors.white, width: 2)
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 18, 25, 0),
              width: double.infinity,
              child: MaterialButton(
                color: Colors.white,
                clipBehavior: Clip.antiAlias,
                onPressed: () {
                  Navigator.pushNamed(context, HomeRoute);
                },
                child: Text(
                  "Sign up with google",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "BalooDa2",
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
//                      side: BorderSide(color: Colors.white, width: 2)
                ),
              ),
            ),
          ],
        );
    Widget _signUpForm() => Container(
      margin: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(
            children: [
              TextFormField(
                obscureText: false,
                cursorColor: Colors.white,
                cursorHeight: 18,
                style: TextStyle(
                  height: 1,
                  color: ColorsLocal.hexToColor("E1E1E1"),
                  fontFamily: "BalooDa2",
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
                decoration: new InputDecoration(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //  when the TextFormField in focused
                    ),
                    // hoverColor: Colors.white,

                    labelStyle: TextStyle(
                        color: ColorsLocal.hexToColor("E1E1E1"),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    labelText: 'Enter your username'),
              ),
              TextFormField(
                obscureText: false,
                cursorColor: Colors.white,
                cursorHeight: 18,
                style: TextStyle(
                  height: 1,
                  color: ColorsLocal.hexToColor("E1E1E1"),
                  fontFamily: "BalooDa2",
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
                decoration: new InputDecoration(
                    suffixIcon: GestureDetector(child: Icon(Icons.visibility,color: Colors.white,size: 15,)),
                  //  focusColor: Colors.green.withOpacity(1),
                   
                   // fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //  when the TextFormField in focused
                    ),
                    // hoverColor: Colors.white,
                    labelStyle: TextStyle(
                        color: ColorsLocal.hexToColor("E1E1E1"),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    labelText: 'Enter Password'),
              ),
              TextFormField(
                obscureText: false,
                cursorColor: Colors.white,
                cursorHeight: 18,
                style: TextStyle(
                  height: 1,
                  color: ColorsLocal.hexToColor("E1E1E1"),
                  fontFamily: "BalooDa2",
                  fontWeight: FontWeight.w100,
                  fontSize: 18,
                ),
                decoration: new InputDecoration(
                    suffixIcon: GestureDetector(child: Icon(Icons.visibility,color: Colors.white,size: 15,)),
                    focusColor: Colors.white.withOpacity(.8),

                    // fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      //  when the TextFormField in focused
                    ),
                    // hoverColor: Colors.white,
                    labelStyle: TextStyle(
                        color: ColorsLocal.hexToColor("E1E1E1"),
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w100,
                        fontSize: 14),
                    labelText: 'Confirm Password'),
              ),
            ],
          ),
        );
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: ColorsLocal.hexToColor("31353A"),
          height: MediaQuery.of(context).size.height * .3,
          child: Center(child: _singIn()),
        ),
      ),
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(0.0)),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sign Up To",
                style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
              Text(
                "Dotara.",
                style: TextStyle(
                    height: 1,
                    color: Colors.white,
                    fontFamily: "BalooDa2",
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
              _signUpForm(),
              Container(
                margin: EdgeInsets.fromLTRB(25, 50, 25, 40),
                width: double.infinity,
                child: MaterialButton(
                  color: ColorsLocal.hexToColor("31353A"),
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                   // snapshot.pressed();
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "BalooDa2",
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    //side: BorderSide(color: Colors.white, width: 0)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
