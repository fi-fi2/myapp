
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:myapp/signup.dart';



class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formstate = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: formstate,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: "Enter your email",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF459191)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter your password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF459191)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                MaterialButton(
                  height: 40,
                  color: Color(0xFF459191),
                  textColor: Colors.white,
                  onPressed: () {
                    if (formstate.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check, size: 50, color: Colors.green),
                                SizedBox(height: 20),
                                Text('Login Successful', style: TextStyle(fontSize: 18)),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomePage()),
                                    );
                                  },
                                  child: Text('Home'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      print("not valid");
                    }
                  },
                  child: Text("Login", style: TextStyle(fontSize: 18),),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Connexion()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          decoration: TextDecoration.underline,color: Color(0xFF459191),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("______________ ou ______________",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),),
                SizedBox(height: 30.0),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 200, 214, 214),
                  ),
                  child: Row(
                    children: [
                      Text("     "),
                      Icon(Icons.facebook,color: const Color.fromARGB(255, 2, 55, 99)),
                      Text("          "),
                      Text("Sign in with Facebook",style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 200, 214, 214),
                  ),
                  child: Row(
                    children: [
                      Text("     "),
                      Icon(Icons.mail_sharp,color: Color.fromARGB(255, 175, 168, 148)),
                      Text("           "),
                      Text("Sign in with Google",style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color.fromARGB(255, 200, 214, 214),
                  ),
                  child: Row(
                    children: [
                      Text("     "),
                      Icon(Icons.apple,size: 30,),
                      Text("          "),
                      Text("Sign in with Apple",style: TextStyle(
                        fontSize: 20.0,
                      ),),
                    ],
                  ),
                )
              ],
            ),
            
          ),
        ),
      ),
      floatingActionButton: Padding(
  padding: EdgeInsets.only(bottom: 720.0, right: 10.0),
  child: TextButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
    child: Text(
      'Skip',
      style: TextStyle(
        decoration: TextDecoration.underline,fontSize: 20.0,color: Color(0xFF459191), // Souligner le texte
      ),
    ),
  ),
),
    );
  }
}

