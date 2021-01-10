import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  @override

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child:Column(
                      children: [
                        SizedBox(height:60),
                        Container(
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                offset: Offset(0,20),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom:BorderSide(color:Colors.grey[100]),),
                                ),
                                child:TextField(
                                  onChanged: (value){
                                    email = value;
                                  },
                                  decoration:InputDecoration(
                                    hintText: 'Phone or Email',
                                    border: InputBorder.none,
                                    hintStyle:TextStyle(
                                      color:Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:EdgeInsets.all(10),
                                decoration:BoxDecoration(
                                  border:Border(bottom:BorderSide(color:Colors.grey[100]),),
                                ),
                                child:TextField(
                                  onChanged: (value){
                                    password = value;
                                  },
                                  obscureText: true,
                                  decoration:InputDecoration(
                                    hintText: 'Password',
                                    border:InputBorder.none,
                                    hintStyle: TextStyle(
                                      color:Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:60),
                        Text(
                          'Forgot Password',
                          style:TextStyle(
                            color:Colors.grey,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                        SizedBox(height:40),
                        GestureDetector(
                          onTap: ()async{
                           try{
                             final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                             if(user != null){
                               Navigator.pushNamed(context, 'home_screen');
                             }
                           }catch(e){
                             print(e);
                           }
                          },
                          child:Container(
                            margin:EdgeInsets.symmetric(horizontal:50),
                            height:50,
                            decoration:BoxDecoration(
                              color:Colors.orange[900],
                              borderRadius:BorderRadius.circular(60),
                            ),
                            child:Center(
                              child:Text(
                                'Login',
                                style:TextStyle(
                                  color:Colors.white,
                                  fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height:40),
                        Text(
                          'Continue with Social Media',
                          style:TextStyle(
                            color:Colors.grey,
                          ),
                        ),
                        SizedBox(height:40),
                        Row(
                          children: [
                            Expanded(
                              child:GestureDetector(
                                onTap: (){
                                  print('facebook button got pressed');
                                },
                                child: Container(
                                  height:50,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color:Colors.blue,
                                  ),
                                  child:Center(
                                    child:Text(
                                      'facebook',
                                      style:TextStyle(
                                        fontWeight:FontWeight.bold,
                                        color:Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width:20),
                            Expanded(
                              child:GestureDetector(
                                onTap: (){
                                },
                                child: Container(
                                  height:50,
                                  decoration:BoxDecoration(
                                    color:Colors.lightBlueAccent,
                                    borderRadius:BorderRadius.circular(50),
                                  ),
                                  child:Center(
                                    child:Text(
                                      'Google',
                                      style:TextStyle(
                                        color:Colors.white,
                                        fontWeight:FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



