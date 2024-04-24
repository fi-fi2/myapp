import 'package:flutter/material.dart';
import 'package:myapp/login.dart';

class Connexion extends StatefulWidget {
  Connexion({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<Connexion> {
  GlobalKey<FormState> Sign = GlobalKey();
  bool agreedToConditions = false;

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
            key: Sign,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,),
                ),
                SizedBox(height: 30.0),
                TextFormField(
                  autofocus: false, // Définir le focus sur ce champ
                  textInputAction: TextInputAction.next, // Afficher "Next" sur le clavier
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,color: Color(0xFF459191),),
                    hintText: "username",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF459191)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  textInputAction: TextInputAction.done, // Afficher "Done" sur le clavier
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_lock,color: Color(0xFF459191)),
                    hintText: "email address",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF459191)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  textInputAction: TextInputAction.done, // Afficher "Done" sur le clavier
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The field is empty";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password,color: Color(0xFF459191)),
                    hintText: "password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF459191)),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: agreedToConditions,
                      checkColor: Colors.white, // Couleur de la coche lorsque cochée
                      activeColor: Color(0xFF459191), // Couleur de fond de la coche
                      onChanged: (value) {
                        setState(() {
                          agreedToConditions = value!;
                        });
                      },
                    ),
                    Text("I agree to the terms and conditions"),
                  ],
                ),
                SizedBox(height: 30.0),
                MaterialButton(
                  height: 40,
                  color: Color(0xFF459191),
                  textColor: Colors.white,
                  onPressed: () {
                    if (agreedToConditions && Sign.currentState!.validate()) {
                      print("valid");
                    } else {
                      print("not valid");
                    }
                  },
                  child: Text("Sign Up",style: TextStyle(fontSize: 18),),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Aligner les éléments à droite
                  children: [
                    Text("Have already account?",textAlign: TextAlign.center,),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          decoration: TextDecoration.underline,color: Color(0xFF459191), // Souligner le texte
                        ),
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ),
        ),
      ),
    ); 
  }
}
